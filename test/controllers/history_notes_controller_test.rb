require 'test_helper'

class HistoryNotesControllerTest < ActionController::TestCase
  setup do
    @history_note = history_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:history_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create history_note" do
    assert_difference('HistoryNote.count') do
      post :create, history_note: { cohorte: @history_note.cohorte, materia: @history_note.materia, nota: @history_note.nota, participante: @history_note.participante, periodo: @history_note.periodo }
    end

    assert_redirected_to history_note_path(assigns(:history_note))
  end

  test "should show history_note" do
    get :show, id: @history_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @history_note
    assert_response :success
  end

  test "should update history_note" do
    patch :update, id: @history_note, history_note: { cohorte: @history_note.cohorte, materia: @history_note.materia, nota: @history_note.nota, participante: @history_note.participante, periodo: @history_note.periodo }
    assert_redirected_to history_note_path(assigns(:history_note))
  end

  test "should destroy history_note" do
    assert_difference('HistoryNote.count', -1) do
      delete :destroy, id: @history_note
    end

    assert_redirected_to history_notes_path
  end
end
