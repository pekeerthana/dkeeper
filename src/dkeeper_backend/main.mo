import List "mo:base/List";
import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Nat "mo:base/Nat";

persistent actor DKeeper{

  public type Note = {
    title: Text;
    content: Text;
  };

  var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text,contentText: Text ){
    
    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

    notes := List.push(newNote,notes);
    Debug.print(debug_show(notes));
  };

  public query func readNotes() : async [Note]{
    return List.toArray(notes);
  };

  public func deleteNote(id:Nat){
    let newList = List.take(notes,id);
    let deletednotes = List.drop(notes,id+1);
    notes:= List.append(newList,deletednotes);

  }
  

}