package todo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TodoController {
  private List<Todo> todos = new ArrayList<>();

  @RequestMapping("/")
  public String index(Model model) {

    model.addAttribute("todos", todos);
    System.out.println("working on index ....");
    return "index";
  }

  @RequestMapping(value = "/add", method = RequestMethod.POST)
  public String add(@RequestParam(name = "text") String text) {
    todos.add(new Todo(text));
    return "redirect:/";
  }

  @RequestMapping(value = "/edit", method = RequestMethod.POST)
  public String edit(@RequestParam(name = "index") int index, @RequestParam(name = "newText") String newText) {
    todos.get(index).setText(newText);
    return "redirect:/";
  }

  @RequestMapping(value = "/delete", method = RequestMethod.POST)
  public String delete(@RequestParam(name = "index") int index) {
    todos.remove(index);
    return "redirect:/";
  }
}
