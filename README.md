


## 編集方法 (※ github上で直接編集する場合)
1. 現在，mainブランチにいる事を確認する.
2. ファイルを編集もしくは追加する
   - Pubications (論文・書籍・受賞・共同研究; /publications に表示されるもの) は `collections/_publications_*` 以下にMarkdown形式で追加する．フォーマットやファイルの命名規則は既存のファイルを参考にすること．
   - News (トップページに表示されるおしらせ; /news/* の内容) は `collections/_posts` 以下にMarkdown形式で追加する．フォーマットやファイルの命名規則は既存のファイルを参考にすること．
   - Events (イベント情報; /events/* の内容) は `collections/events` 以下にMarkdown形式で追加する．フォーマットは既存のファイルを参考にすること．
3. 一つのファイルの編集・追加が終わったら，コミットする．
   - コミット時は，新たなブランチが作成されるよう設定されている
   - 他のファイルを編集する場合は，今度はmainブランチではなく，新たに作成されたブランチに切り替えてから行うこと
4. プルリクエストを作成する
5. previewを確認する
   - ※ 詳細後ほど調整します.一旦無視してください
6. 問題がなければ，mainブランチにマージする




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