pragma solidity ^0.4.0;

contract VotingBallot{
  struct Candidates{
    uint active;
    uint votes;
  }
  struct Voters{
    uint isVoted;
  }
  mapping(uint => Candidates)  candidates;
  mapping(uint => Voters)  voters;
  uint[] candidateList;
  uint candidateCount;
  address public  gov;
  function VotingBallot() public {
    gov = msg.sender;
  }
  function addCandidate(uint _cid) public {
    if(msg.sender != gov) return;
    if(candidates[_cid].active == 1) return;
    candidates[_cid].votes = 0;
    candidates[_cid].active = 1;
    candidateCount++;
    candidateList.push(_cid);

  }
  function castVote(uint _vid,uint _cid) public {
    if(voters[_vid].isVoted == 1) return;
    if(candidates[_cid].active == 0) return;
    voters[_vid].isVoted = 1;
    candidates[_cid].votes += 1;
  }
  function viewVotes(uint _cid) public view returns(uint){
    return candidates[_cid].votes;
  }
  function candidateAvailable() public view returns(uint[]){
    return candidateList;
  }

}
