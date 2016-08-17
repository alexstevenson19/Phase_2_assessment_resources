var SalesTeam = function(employees) {
  this.employees = employees;
}

SalesTeam.prototype.find = function(searchName) {

  var employees = this.employees;
  // console.log(employees);
  for (var i = 0; i < employees.length; i++) {
    if (employees[i].firstName === searchName) {
      return employees[i]
    }
  }
}


SalesTeam.prototype.topPerformer = function(topAverage) {
  var topSales = this.employees[0].averageSales();

  for (var i = 1; i < this.employees.length; i++) {
    if (this.employees[i].averageSales() > topSales) {
      topSales = this.employees[i];
    }
    return topSales;
  }
}
