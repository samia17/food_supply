pragma solidity >=0.4.22 <0.7.0;
/**
 * @title Food supply management
 * @dev Store & retreive patient details in Medicalrecords
 */
 import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
 
contract Food is ERC721 {
    mapping(uint256 => product) productlist;
     mapping(uint256 => status) productstatus;
       mapping(uint256 => food) foodlist;
    
     struct food{
     uint256 food_id;
     }
     food f;
    
     struct product{
     uint256 product_id;
     string product_type;
     uint256 product_quantity;
     }
     product p;
     
     struct status{
     uint256 product_id;
     string product_status;
     }
     status s;
   
     

      address owner;
     
      /**
     * @dev Create the Token by Passing the Name and Symbol to the ERC721 Constructor
     */
      constructor() ERC721("AmritaMedicalCoin","AMC") public {
          
          owner = 0x34d8bC94989BbE14BCfd98E0550201ba4970B776; //Address of Doctor
          
      }
      
      // modifier to give access only to doctor
      modifier isOwner() {

         require(msg.sender == owner, "Access is not allowed");

         _;

     }
     
     
      /**
     * @dev Function to display name of the token 
    */
    
     function namedecl() public view  returns (string memory) {
         //calling the Built-in function in ERC721
        return name();
    }
    
    
    /**
     * @dev Function to display symbol of the token 
    */
     function symboldecl() public view  returns (string memory) {
         //calling the Built-in function in ERC721
        return symbol();
    }
    
    
    
     /**
     * @dev Function to display total count of the token 
    */
    
     function totalSupplycount() public view  returns (uint256) {
         //calling the Built-in function in ERC721
        return totalSupply();
     }
     
     
     
     /**
     * @dev Function to mint token of food product
     *  @param food_id food id
    */
     function food_product(uint256 food_id)public{
       //Calling the Built-in function in ERC721
        _mint(msg.sender,food_id);
        
        
        foodlist[food_id] = f;
         }
     
      
   
      /**
     * @dev Store product details
     * @param product_id product id
     * @param _product_type product type
     * @param _product_quantity product quantity
     */
      function product_details( uint256 product_id,string memory _product_type,uint256 _product_quantity)public isOwner {
              
              
              p.product_type = _product_type;
              p.product_quantity = _product_quantity;
              
              
              productlist[product_id] = p;
              
          }
          
          
           
     /**
     * @dev Retreive product details
     * @param product_id product id
     * */
          function get_product(uint256 product_id)public view returns (string memory,uint256){
              
             product memory p = productlist[product_id];
             return (p.product_type, p.product_quantity);
          }
    
         
           /**
     * @dev Store product status details
     * @param product_id product id
     * @param _product_status product status
     */
          function product_status(uint256 product_id,string memory _product_status)public isOwner {
              
              s.product_status = _product_status;
              
              productstatus[product_id] = s;
          }
          
           /**
     * @dev Retreive  product status details
     * @param product_id product id
     * */
          function get_present_illness(uint256 product_id)public view returns (string memory){
              
               status memory s = productstatus[product_id];
               return (s.product_status);
          }
          
}
