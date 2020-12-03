pragma solidity >=0.4.22 <0.7.0;
/**
 * @title consumer Registration
 * @dev Store & retreive consumer details 
 */
 
contract consumer  {
    
     
      mapping(uint256 => consumer) consumerlist;
      
    
     struct consumer{
         string consumer_name;
         string consumer_addr;
         uint256 consumer_pno;
         string product_type;
         uint256 product_quantity;
     }
    consumer c;
     
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
     * @dev Store consumer details
     * @param consumer_id producer registration id
     * @param _consumer_name name of consumer
     * @param _consumer_addr address of consumer
     * @param _consumer_pno  phone number of consumer
     * @param _product_type type of product_quantity
     * @param _product_quantity quantity of product
     * */
     function store_consumer_details(uint256 consumer_id,string memory _consumer_name,string memory _consumer_addr,uint256 _consumer_pno,string memory _product_type,uint256 _product_quantity)public isOwner {
        
        c.consumer_name = _consumer_name;
        c.consumer_addr = _consumer_addr;
         c.consumer_pno = _consumer_pno;
         c.product_type = _product_type;
        c.product_quantity = _product_quantity;
         
         
        consumerlist[consumer_id] = c;
        
        
         }
         
        
           /**
     * @dev Retreive consumer details
     * @param consumer_id consumer registration id
     * */
         function retreive_consumer_details(uint256 consumer_id) public view returns (string memory,string memory,uint256,string memory,uint256){
             
     consumer memory c = consumerlist[consumer_id];
     
     return (c.consumer_name,c.consumer_addr,c.consumer_pno,c.product_type,c.product_quantity);
     
          }
          
          
          
}
