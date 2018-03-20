pragma solidity ^0.4.18;

contract Courses {
    
    struct Candidates{
        uint id;
        uint votes;
        
    }
    struct Voters{
        uint uid;
        uint voted;
    }
    mapping (uint => Voters) voters;
    uint[] public votersAcct;
    /*uint[] fid;
    uint i;
    uint status = 1;*/
    mapping (uint => Candidates) candidates;
    uint[] public candidatesAcct;
    
    function setCandidate(uint _id) public{
                var candidate = candidates[_id];
                candidate.votes = 0;
                candidatesAcct.push(_id) -1;
        
    }
    function addVote(uint _uid,uint _id) public{
        /*for(i=0;i<fid.length;i++){
            if(fid[i] == _uid){
                status = 0;
                break;
            }else{
                status = 1;
            }
        }
        if(status == 1){
            candidates[_id].votes += 1;
            fid.push(_uid) -1;
        }*/
        if(voters[_uid].voted == 0){
            candidates[_id].votes += 1;
            var voter = voters[_uid];
                voter.voted = 1;
                votersAcct.push(_uid) -1;
            
        } else{
            
        }
    }
    function viewVotes(uint _id)view public returns(uint){
        return candidates[_id].votes;
    }
     function getCandidates() view public returns(uint[]) {
        return candidatesAcct;
    }
    
}
