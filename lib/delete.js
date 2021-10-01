const readline = require("readline");
const axios = require("axios");
const url = `https://api.github.com/graphql`;

(async () => {
  // パッケージを取得
  const fetchPackageId = async () => {
    const version = process.argv[2];
    const query = {
      query: `
      {
        repository(owner: "n-iwata", name: "node-typescript-sample") {
          packages(first: 10) {
            edges {
              node {
                packageType
                id
                versions(first: 100) {
                  nodes {
                    id
                    version
                  }
                }
              }
            }
          }
        }
      }
    `,
    };

    try {
      const res = await axios.post(url, query, {
        headers: {
          Accept: "application/vnd.github.package-deletes-preview+json=2",
          Authorization: `bearer ${process.env.GITHUB_TOKEN}`,
        },
      });

      const deletePackageId =
        res.data.data.repository.packages.edges[0].node.versions.nodes
          .filter((node) => node.version.includes(version))
          .filter((node) => node.version.includes("-"))
          .map((data) => data.id);
      return deletePackageId;
    } catch (error) {
      console.error("error: ", error);
    }
  };

  // 不要パッケージを削除
  const removePackages = async (removePackageId) => {
    for (const id of removePackageId) {
      const query = {
        query: `
          mutation ($packageVersionId: String!){
            deletePackageVersion(
              input:{
                clientMutationId: "1",
                packageVersionId: $packageVersionId
              }
            )
            {
              clientMutationId,
              success
            }
          }
      `,
        variables: {
          packageVersionId: id,
        },
      };
      try {
        const res = await axios.post(url, query, {
          headers: {
            Accept: "application/vnd.github.package-deletes-preview+json=2",
            Authorization: `bearer ${process.env.GITHUB_TOKEN}`,
          },
        });
      } catch (error) {
        console.error("error: ", error);
      }
    }
  };

  const confirm = async (msg) => {
    const answer = await question(`${msg}(y/n): `);
    return answer.trim().toLowerCase() === "y";
  };

  const question = (question) => {
    const readlineInterface = readline.createInterface({
      input: process.stdin,
      output: process.stdout,
    });
    return new Promise((resolve) => {
      readlineInterface.question(question, (answer) => {
        resolve(answer);
        readlineInterface.close();
      });
    });
  };

  const main = async () => {
    if (process.argv[2]) {
      console.log(`Remove the RC version packages of v${process.argv[2]}`);
      if (await confirm("> OK?")) {
        const removePackageId = await fetchPackageId();
        if (removePackageId.length > 0) {
          await removePackages(removePackageId);
          console.log("Done!!");
        } else {
          console.log("no package...");
        }
      } else {
        console.log("Canceled");
      }
      console.log("");
    } else {
      console.log("Please specify the version to delete");
    }
  };

  await main();
})();
