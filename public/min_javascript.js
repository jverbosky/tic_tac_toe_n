// Just use JavaScript to replace HTML with images (for game over)

var table = document.getElementById("table_id");
var cells = table.getElementsByTagName("td");

for (var i = 0; i < cells.length; i++) {

    // Cell Object
    var cell = cells[i];
    cell.positionIndex = i;
    cell.totalCells = cells.length;

    // list game_board array index and HTML value
    // console.log("Position: " + i + " and value: " + cell.innerHTML)

    // conditional to replace HTML text with image if X or O
    if (cell.innerHTML == "X") {
        cell.innerHTML = '<img src="/images/x.png">';
    } else if (cell.innerHTML == "O") {
        cell.innerHTML = '<img src="/images/o.png">';
    } else {
        cell.innerHTML = '<img src="/images/empty.png">';
    }

}