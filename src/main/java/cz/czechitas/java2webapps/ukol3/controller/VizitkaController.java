package cz.czechitas.java2webapps.ukol3.controller;

import cz.czechitas.java2webapps.ukol3.entity.Vizitka;
import cz.czechitas.java2webapps.ukol3.service.VizitkaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Kontroler obsluhující zobrazování vizitek.
 */
@Controller
public class VizitkaController {
  private final VizitkaService service;

  public VizitkaController(VizitkaService service) {
    this.service = service;
  }

  @GetMapping("/")
  public ModelAndView seznam() {
    ModelAndView result = new ModelAndView("seznam");
    result.addObject("seznam", service.getAll());
    return result;
  }

  @GetMapping("/detail/{id}")
  public ModelAndView detail(@PathVariable int id) {
    ModelAndView result = new ModelAndView("detail");
    result.addObject("vizitka", service.getById(id));
    result.addObject("idVizitka", id);
    return result;
  }

  @GetMapping("/nova")
  public ModelAndView novaVizitka() {
    return new ModelAndView("novaVizitka");
  }

  @PostMapping("/pridejVizitku")
  public String pridejVizitku(Vizitka vizitka) {
   service.pridejVizitku(vizitka);
   return "redirect:/";
  }

  @PostMapping(path = "/delete", params = "id")
  public String delete(int id) {
    service.smazVizitku(id);
    return "redirect:/";
  }
}
