require_relative "../object_transport_optimization_brute_force.rb"

RSpec.describe ObjectTransportOptimizationBruteForce do
  tested_object = ObjectTransportOptimizationBruteForce

  describe "Default example" do
    it "Does the operations and return a right answer" do
      expect(

        tested_object.new(
           2000,
           {
             "1" => {:weight => 400, :profit => 200, :weight_profit => 0.5},
             "2" => {:weight => 500, :profit => 200, :weight_profit => 0.4},
             "3" => {:weight => 700, :profit => 300, :weight_profit => 0.43},
             "4" => {:weight => 900, :profit => 400, :weight_profit => 0.44},
             "5" => {:weight => 600, :profit => 400, :weight_profit => 0.66}
           }
        ).perform

      ).to eq(["10011", 1000])
    end
  end

  describe "Default example with a smaller max weight" do
    it "Delete the objects that are heavier than max weight, does the operations and return a right answer" do
      expect(

        tested_object.new(
           500,
           {
             "1" => {:weight => 400, :profit => 200, :weight_profit => 0.5},
             "2" => {:weight => 500, :profit => 200, :weight_profit => 0.4},
             "3" => {:weight => 700, :profit => 300, :weight_profit => 0.43},
             "4" => {:weight => 900, :profit => 400, :weight_profit => 0.44},
             "5" => {:weight => 600, :profit => 400, :weight_profit => 0.66}
           }
        ).perform

      ).to eq(["10", 200])
    end
  end

  describe "Default example with a bigger max weight" do
    it "Consider all the objects, does the operations and return a right answer" do
      expect(

        tested_object.new(
           10000,
           {
             "1" => {:weight => 400, :profit => 200, :weight_profit => 0.5},
             "2" => {:weight => 500, :profit => 200, :weight_profit => 0.4},
             "3" => {:weight => 700, :profit => 300, :weight_profit => 0.43},
             "4" => {:weight => 900, :profit => 400, :weight_profit => 0.44},
             "5" => {:weight => 600, :profit => 400, :weight_profit => 0.66}
           }
        ).perform

      ).to eq(["11111", 1500])
    end
  end

  describe "Default example with all objects heavier that max weight" do
    it "Return an empty result and a profit = 0" do
      expect(

        tested_object.new(
           1,
           {
             "1" => {:weight => 400, :profit => 200, :weight_profit => 0.5},
             "2" => {:weight => 500, :profit => 200, :weight_profit => 0.4},
             "3" => {:weight => 700, :profit => 300, :weight_profit => 0.43},
             "4" => {:weight => 900, :profit => 400, :weight_profit => 0.44},
             "5" => {:weight => 600, :profit => 400, :weight_profit => 0.66}
           }
        ).perform

      ).to eq(["", 0])
    end
  end

  describe "Passing an empty object as objects" do
    it "Returns an error message" do
      expect(

        tested_object.new(
           6000,
           {}
        ).perform

      ).to eq(["Invalid arguments!", "Try again :)"])
    end
  end

  describe "Passing 0 as max weight" do
    it "Returns an error message" do
      expect(

        tested_object.new(
           0,
           {
             "1" => {"weight" => 400, "profit" => 200, "weight_profit" => 0.5},
             "2" => {"weight" => 500, "profit" => 200, "weight_profit" => 0.4},
             "3" => {"weight" => 700, "profit" => 300, "weight_profit" => 0.43},
             "4" => {"weight" => 900, "profit" => 400, "weight_profit" => 0.44},
             "5" => {"weight" => 600, "profit" => 400, "weight_profit" => 0.66}
           }
        ).perform

      ).to eq(["Invalid arguments!", "Try again :)"])
    end
  end

  describe "Passing nil as objects" do
    it "Returns an error message" do
      expect(

        tested_object.new(
           5000,
           nil
        ).perform

      ).to eq(["Invalid arguments!", "Try again :)"])
    end
  end

  describe "Passing nil as max weight" do
    it "Returns an error message" do
      expect(

        tested_object.new(
           nil,
           {
             "1" => {"weight" => 400, "profit" => 200, "weight_profit" => 0.5},
             "2" => {"weight" => 500, "profit" => 200, "weight_profit" => 0.4},
             "3" => {"weight" => 700, "profit" => 300, "weight_profit" => 0.43},
             "4" => {"weight" => 900, "profit" => 400, "weight_profit" => 0.44},
             "5" => {"weight" => 600, "profit" => 400, "weight_profit" => 0.66}
           }
        ).perform

      ).to eq(["Invalid arguments!", "Try again :)"])
    end
  end

end

