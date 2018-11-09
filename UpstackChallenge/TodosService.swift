import Foundation

class TodosService {
        private var completionHandler: (([Todo]) -> Void)?

        func fetchTodos(completion: (([Todo]) -> Void)) {
                fetchJson(parseTodos)
        }

        func fetchJson(parser: ((Data) -> Void))  {
                guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
                        else {
                        return
                }

                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                        guard let dataResponse = data,
                              error == nil else {
                                print(error?.localizedDescription ?? "Response Error")
                                return
                        }

                        parse(dataResponse);
                }
                task.resume()
        }

        func parseTodos(data: Data) {
                do {
                        let decoder = JSONDecoder()
                        let todos = try decoder.decode(
                                [Todo].self,
                                from: data
                        )

                        completionHandler?(todos);
                } catch let e {
                        print(e)
                }
        }
}
