<?php
header("Content-Type: application/json");

$items = [
    ["id" => 1, "name" => "Pen", "price" => 10],
    ["id" => 2, "name" => "Notebook", "price" => 50],
    ["id" => 3, "name" => "Bag", "price" => 900],
    ["id" => 4, "name" => "Pencil", "price" => 5],
    ["id" => 5, "name" => "Eraser", "price" => 5],
    ["id" => 6, "name" => "Sharpener", "price" => 10],
    ["id" => 7, "name" => "Scale", "price" => 15],
    ["id" => 8, "name" => "Marker", "price" => 30],
    ["id" => 9, "name" => "Highlighter", "price" => 40],
    ["id" => 10, "name" => "Stapler", "price" => 120],
    ["id" => 11, "name" => "Calculator", "price" => 450],
    ["id" => 12, "name" => "File Folder", "price" => 60],
    ["id" => 13, "name" => "Glue Stick", "price" => 25],
    ["id" => 14, "name" => "Scissors", "price" => 80],
    ["id" => 15, "name" => "Paper Clips", "price" => 20]
];

echo json_encode($items);
