var Employee = function({firstName, sales}) {
  this.firstName = firstName;
  this.sales = sales;
}

Employee.prototype.totalSales = function() {
  return this.sales.reduce((a, b) => a + b, 0)
}

Employee.prototype.averageSales = function() {
  return this.totalSales()/this.sales.length;
}
