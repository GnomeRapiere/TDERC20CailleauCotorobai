pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ExerciceSolution is ERC20
{

mapping(address => uint256) public liste;

constructor(string memory name, string memory symbol,uint256 initialSupply) public ERC20(name, symbol) {_mint(msg.sender, initialSupply);}
    
  function getToken() external returns (bool)
{
	require(liste[msg.sender] != 0);
	uint256 balanceavant = balanceOf(msg.sender);
	_mint(msg.sender,5 ether);
	uint256 balanceapres = balanceOf(msg.sender);
	return balanceapres > balanceavant;
}

  function buyToken() external payable returns (bool)
{
	require(liste[msg.sender] != 0);
	uint256 balanceavant = balanceOf(msg.sender);
	_mint(msg.sender,liste[msg.sender] * msg.value); 
	uint256 balanceapres = balanceOf(msg.sender);
	return balanceapres > balanceavant;
}



  function isCustomerWhiteListed(address customerAddress) external returns (bool)
{
	return liste[customerAddress] != 0;
}

  function modifTierLevel(address customerAddress, uint256 tierlevel) external
{
	liste[customerAddress] = tierlevel;
}

  function customerTierLevel(address customerAddress) external returns (uint256)
{
	return liste[customerAddress];
}

}