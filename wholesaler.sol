pragma solidity >=0.4.22 <0.7.0;
/**
 * @title wholesaler Registration
 * @dev Store & retreive wholesaler details 
 */
 
contract wholesaler  {
    
     
      mapping(uint256 => wholesaler) wholesalerlist;
      
    
     struct wholesaler{
         string wholesaler_name;
         string wholesaler_addr;
         uint256 wholesaler_pno;
         string product_type;
         uint256 product_quantity;
     }
    wholesaler w;
     
     address owner;
     
      
    
      constructor() public {
          owner = msg.sender;
      }
      
      
      // modifier to give access only to hospital
      modifier isOwner() {

         require(msg.sender == owner, "Access is not allowed");

         _;

     }
      
     
     
    
    
     /**
     * @dev Store wholesaler details
     * @param wholesaler_id producer registration id
     * @param _wholesaler_name name of wholesaler
     * @param _wholesaler_addr address of wholesaler
     * @param _wholesaler_pno  phone number of wholesaler
     * @param _product_type type of product_quantity
     * @param _product_quantity quantity of product
     * */
     function store_wholesaler_details(uint256 wholesaler_id,string memory _wholesaler_name,string memory _wholesaler_addr,uint256 _wholesaler_pno,string memory _product_type,uint256 _product_quantity)public isOwner {
        
        w.wholesaler_name = _wholesaler_name;
        w.wholesaler_addr = _wholesaler_addr;
         w.wholesaler_pno = _wholesaler_pno;
         w.product_type = _product_type;
        w.product_quantity = _product_quantity;
         
         
        wholesalerlist[wholesaler_id] = w;
        
        
         }
         
        
           /**
     * @dev Retreive wholesaler details
     * @param wholesaler_id wholesalerregistration id
     * */
         function retreive_wholesaler_details(uint256 wholesaler_id) public view returns (string memory,string memory,uint256,string memory,uint256){
             
     wholesaler memory w = wholesalerlist[wholesaler_id];
     
     return (w.wholesaler_name,w.wholesaler_addr,w.wholesaler_pno,w.product_type,w.product_quantity);
     
          }
          
          
          
}
