.pragma library

function getFilesInDir(pathToDir) {

   const fs = require("fs");

   return fs.readdir(pathToDir, (err, files) => {
                  if (err) {
                      return;
                  }

                  return files;
              }
       );
}
