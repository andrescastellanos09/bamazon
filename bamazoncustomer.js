var mysql = require("mysql");
var inquirer= require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "",
  database: "bamazon_db"
});

connection.connect(function(err) {
    if (err) throw err;
    console.log("Welcome to Bamazon ID connection: " + connection.threadId);
    displayProducts();
    
});

var displayProducts = function() {
    var query = 'SELECT * FROM Products'
    connection.query(query, function(err, res) {
        for (var i = 0; i < res.length; i++) {
            console.log("Item ID: " + res[i].item_id + " || Product: " + res[i].product_name + " || Department: " + res[i].department_name + " || Price: " + res[i].price + " || Stock: " + res[i].stock_quantity);
        }
    shoppingCart();    
    }
)
};

var shoppingCart = function() {
    inquirer.prompt([{
        name: "ProductID",
        type: "input",
        message: "What is the ID of the product you would like to buy?",
        //Validate: checks weather or not the user typed
        validate: function(value) {
            if (isNaN(value) == false) {
                return true;
            } else {
                return false;
            }
        }
    }, {
        name: "Quantity",
        type: "input",
        message: "How many would you like to buy?",
        validate: function(value) {
            if (isNaN(value) == false) {
                return true;
            } else {
                return false;
            }
        }
    }]).then(function(answer) {

      
        var query = 'SELECT * FROM Products WHERE item_id=' + answer.ProductID;
        
        connection.query(query, function(err, res) {
            console.log(res);
          if (answer.Quantity <= res[0].stock_quantity) {
            
            for (var i = 0; i < res.length; i++) {
                
                var remainingProducts = res[i].stock_quantity - answer.Quantity;
                console.log("We have "+remainingProducts+" "+res[i].product_name+" left.");
                console.log("Thank you for your order! Your order of " + answer.Quantity + " " + res[i].product_name + " is now being processed.");
                console.log("Your total is $"+res[i].price)
              }
            } else {
              console.log("Not enough of this product in stock.");
            }
            displayProducts();
        })
    })
};


