import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {
  // Creates new datatype with title: Text and content: Text
  // When declaring the type, we use a colon (:)

  public type Note = {
    title: Text;
    content: Text;
  };

  // This is equivalent to a JS array which contains Note objects
  // But it is actually a List which contains objects of type Note

  var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text) {
    // When assigning a value, we use a equal sign (=)

    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

    // Pushes a Note from newNote to the List notes

    notes := List.push(newNote, notes);
    Debug.print(debug_show(notes));
  };
}