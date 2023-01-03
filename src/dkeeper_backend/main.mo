import List "mo:base/List";
import Debug "mo:base/Debug";
import Array "mo:base/Array";

actor DKeeper {
  // Creates new datatype with title: Text and content: Text
  // When declaring the type, we use a colon (:)

  public type Note = {
    title: Text;
    content: Text;
  };

  // This is equivalent to a JS array which contains Note objects
  // But it is actually a List which contains objects of type Note

  stable var notes: List.List<Note> = List.nil<Note>();

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

  public query func readNotes(): async [Note] {
    return List.toArray(notes);
  };

  // drop removes the first list items (drop(2))
  // [D, C, B, A] => [B, A]
  // take takes the first list items (take(2))
  // [D, C, B, A] => [D, C]
  // append joins to lists together (append([D, C], [A]))
  // [D, C], [A] => [D, C, A]

  public func removeNote(id: Nat) {
    let listFront = List.take(notes, id);
    let listBack = List.drop(notes, id + 1);
    notes := List.append(listFront, listBack);
  }
}