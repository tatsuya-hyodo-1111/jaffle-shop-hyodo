{% docs __jaffle_shop_hyodo__ %}

### Welcome!
dbtプロジェクトの自動生成ドキュメントへようこそ！
### Navigation
ウィンドウの左側にあるプロジェクトとデータベースのナビゲーションタブを使って、プロジェクト内のモデルを調べることができます。
#### Project Tab
プロジェクトタブはdbtプロジェクトのディレクトリ構造を反映しています。このタブでは、dbtプロジェクトで定義されたすべてのモデル、およびdbtパッケージからインポートされたモデルを見ることができます。
#### Database Tab
データベースタブにもモデルが表示されますが、よりデータベースエクスプローラーに近い形式で 表示されます。このビューには、データベーススキーマにグループ化されたリレーション（テーブルとビュー）が表示されます。エフェメラルモデルはデータベースに存在しないため、このインターフェースには表示されないことに注意してください。
### グラフ探索
ページの右下にある青いアイコンをクリックすると、モデルの系統グラフを見ることができます。

モデルのページでは、探索中のモデルの直接の親と子が表示されます。この血統ペインの右上にある「展開」ボタンをクリックすると、現在調べているモデルを構築するために使用された、あるいは構築されたすべてのモデルを見ることができます。

一度展開されると、`--select` や `--exclude` のモデル選択構文を使って、グラフ内のモデルをフィルタリングすることができるようになります。モデル選択の詳細については、dbtの[ドキュメント](https://docs.getdbt.com/reference/node-selection/syntax)を参照してください。

また、モデルを右クリックすることで、グラフをインタラクティブにフィルタリングしたり、探索したりすることもできます。

------
### More information
- [What is dbt](https://docs.getdbt.com/docs/introduction)?
- Read the [dbt viewpoint](https://docs.getdbt.com/docs/viewpoint)
- [Installation](https://docs.getdbt.com/docs/installation)
- Join the [dbt Community](https://www.getdbt.com/community/) for questions and discussion

{% enddocs %}