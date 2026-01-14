


## 導入方法 (備忘録)
1. Github Actions の権限を設定する
   - GitHub Organization -> [Settings] -> [Actions] -> [General]
   - `Workflow permissions` を `Read and write permissions` に設定する
1. Github Actions `Build and Deploy` を実行する
   - main に Push すると自動で実行されるが、失敗している場合は手動で再実行する
1. GitHub Pages の設定を行う
   - GitHubの設定から、[Settings] -> [Pages]
   - `Source` を `Deployment branch` に設定する
   - `Branch` は `gh-pages` を選択する
   - `Folder` は `/docs` を選択する
   - `Save` をクリックする