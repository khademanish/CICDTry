public class PriceCalculation {

      

    public string unit_price{get; set;}
    public string quantity{get; set;}
    public integer total_price;
    public PageReference calculate() {
    
          total_price=Integer.valueOf(unit_price) * Integer.valueOf(quantity);
        return null;
    }



    public integer getTotal_price() {
        return total_price;
    }


 
}