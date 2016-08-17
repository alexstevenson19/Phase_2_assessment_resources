describe("Employee", function(){
  var employee;

  beforeEach(function(){
    employee = new Employee({firstName: "Lysette", sales: [500, 100, 250, 1000]});
  });

  describe("firstName", function() {
    it("has a first name", function() {
      expect(employee.firstName).toEqual("Lysette");
    });
  });

  describe("sales", function(){
    it("has a sales property", function(){
      expect(employee.sales).toEqual([500, 100, 250, 1000]);
    });
  });

  describe("totalSales", function(){
    it("calculates the total sales for the employee", function(){
      expect(employee.totalSales()).toBe(1850);
    });
  });

  describe("averageSales", function(){
    it("calculates the average sale for the employee", function(){
      expect(employee.averageSales()).toBeCloseTo(462.5, 2);
    })
  });

});
