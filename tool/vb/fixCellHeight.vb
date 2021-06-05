Sub FixCellHeight()
'余白設定
Const buf = 10
Application.ScreenUpdating = False
'選択した行全ての高さを自動調節する
Selection.Rows.AutoFit

'各行の高さにバッファを追加する
For Each item In Selection.Columns(1).Cells
    item.RowHeight = item.RowHeight + buf
Next

Application.StatusBar = False
Application.ScreenUpdating = True
End Sub

