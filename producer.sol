pragma solidity >=0.4.22 <0.7.0;
/**
 * @title Producer Registration
 * @dev Store & retreive producer details 
 */
 
contract producer  {
    
     
      mapping(uint256 => producer) producerlist;
      
    
     struct producer{
         string producer_name;
         string producer_addr;
         uint256 producer_pno;
         string product_type;
         uint256 product_quantity;
     }
     producer p;
     
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
     * @dev Store producer details
     * @param producer_id producer registration id
     * @param _producer_name name of producer
     * @param _producer_addr address of producer
     * @param _producer_pno  phone number of producer
     * @param _product_type type of product_quantity
     * @param _product_quantity quantity of product
     * */
     function store_producer_details(uint256 producer_id,string memory _producer_name,string memory _producer_addr,uint256 _producer_pno,string memory _product_type,uint256 _product_quantity)public isOwner {
        
         p.producer_name = _producer_name;
        p.producer_addr = _producer_addr;
         p.producer_pno = _producer_pno;
         p.product_type = _product_type;
         p.product_quantity = _product_quantity;
         
         
        producerlist[producer_id] = p;
        
        
         }
         
        
           /**
     * @dev Retreive producer details
     * @param producer_id producer registration id
     * */
         function retreive_producer_details(uint256 producer_id) public view returns (string memory,string memory,uint256,string memory,uint256){
             
     producer memory p = producerlist[producer_id];
     
     return (p.producer_name,p.producer_addr,p.producer_pno,p.product_type,p.product_quantity);
     
          }
          
          
          
}
