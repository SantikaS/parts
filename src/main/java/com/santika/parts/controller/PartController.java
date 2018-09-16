package com.santika.parts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.santika.parts.model.PartEntity;
import com.santika.parts.model.PartsFilter;
import com.santika.parts.service.PartService;

@SessionAttributes(value = "filter")
@Controller
public class PartController {
    private PartService partService;

    @Autowired
    @Qualifier(value = "partService")
    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @ModelAttribute("filter")
    public PartsFilter getPartsFilter() {
        return new PartsFilter();
    }

    @RequestMapping(value = "parts")
    public String listParts(Model model, @ModelAttribute(value = "filter") PartsFilter filter) {
        model.addAttribute("filter", filter);
        model.addAttribute("part", new PartEntity());
        model.addAttribute("listParts", partService.listParts(filter));
        model.addAttribute("pagesCount", (int) Math.ceil(partService.partsCount(filter) * 1.0 / filter.getPartsPerPage()));
        model.addAttribute("compsCount",partService.compsCount());
        return "parts";
    }


    @RequestMapping(value = "/parts/add", method = RequestMethod.POST)
    public String addPart(@ModelAttribute("part") PartEntity partEntity) {

        // choose add or edit entry by ID check.
        if (partEntity.getId() == 0)
            partService.addPart(partEntity);
        else
            partService.updatePart(partEntity);
        return "redirect:/parts";
    }

    @RequestMapping("/remove/{id}")
    public String removePart(@PathVariable("id") int id) {
        partService.removePart(id);
        return "redirect:/parts";
    }

    @RequestMapping("edit/{id}")
    public String editPart(Model model, @ModelAttribute(value = "filter") PartsFilter filter,@PathVariable("id") int id) {
        model.addAttribute("filter", filter);
        model.addAttribute("part", partService.getPartById(id));
        model.addAttribute("listParts", partService.listParts(filter));
        //Some magic for correct page count.
        model.addAttribute("pagesCount", (int) Math.ceil(partService.partsCount(filter) * 1.0 / filter.getPartsPerPage()));
        return "parts";
    }
}
