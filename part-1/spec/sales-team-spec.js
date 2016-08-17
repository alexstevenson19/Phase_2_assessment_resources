describe("SalesTeam", function() {
  var team, jalil, irene, kelvin, myra;

  beforeEach(function() {
    // Define employee objects
    jalil =  new Employee({firstName: "Jalil", sales: [100, 300, 800, 200]});
    irene =  new Employee({firstName: "Irene", sales: [200, 1000, 1000, 500]})
    kelvin = new Employee({firstName: "Kelvin", sales: [800, 100, 750, 100]});
    myra =   new Employee({firstName: "Myra", sales: [900, 700, 1000, 750]});

    // Assign sales team
    team = new SalesTeam([jalil, myra, irene, kelvin]);
  });

  describe("employees", function() {
    it("has employees", function() {
      expect(team.employees).toEqual([jalil, myra, irene, kelvin]);
    });
  });

  describe("finding an employee by name", function() {
    it("returns a employee with that first name", function() {
      expect(team.find("Myra")).toEqual(myra);
    });
  });

  describe("identifying top performer", function() {
    it("returns the top sales employee", function() {
      expect(team.topPerformer()).toEqual(myra)
    });
  });
});
