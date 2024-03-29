defmodule LiveViewTodosWeb.TodoLive do
    import Phoenix.LiveView
    import Phoenix.HTML.Form
    use LiveViewTodosWeb, :live_view
    alias LiveViewTodos.Todos
  
    def mount(_params, _session, socket) do
      todos = Todos.list_todos()
      {:ok, fetch(socket)}
    end

    def handle_event("add", %{"todo" => todo}, socket) do
        Todos.create_todo(todo)

        {:noreply, fetch(socket)}

    end

    defp fetch(socket) do
        assign(socket, todos: Todos.list_todos())
    end
  end
  