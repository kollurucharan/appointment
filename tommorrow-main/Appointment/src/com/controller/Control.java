package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.Dao;
import com.models.DocSchedule;
import com.models.Doctor;
import com.models.Patient;
import com.models.SlotClass;
import com.models.SlotDate;
import com.models.Specialization;

@Controller
public class Control {
	Dao dao;

	@Autowired
	public Control(Dao dao) {
		this.dao = dao;
	}

	ArrayList<DocSchedule> slist = null;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		ArrayList<Specialization> alist = (ArrayList<Specialization>) dao.getAllSpecialization();
		ArrayList<Doctor> dlist = (ArrayList<Doctor>) dao.getAllDoctors();

		model.addAttribute("docList", dlist);
		model.addAttribute("specList", alist);
		return "home";
	}

	@RequestMapping(value = "/seloption", method = RequestMethod.GET)
	public String sele(Specialization spec, Model model) {
		// model.addAttribute("sec", spec.getSpecialization_name());
		ArrayList<Doctor> dlist = null;
		ArrayList<Specialization> alist = (ArrayList<Specialization>) dao.getAllSpecialization();
		if (spec.getSpecialization_name().equals("All")) {
			dlist = (ArrayList<Doctor>) dao.getAllDoctors();
		} else {
			int x = 0;

			for (Specialization spe : alist) {
				if (spe.getSpecialization_name().equals(spec.getSpecialization_name())) {
					x = spe.getSpecialization_id();
				}
			}
			dlist = (ArrayList<Doctor>) dao.getSpecifiedDoctors(x);
		}
		model.addAttribute("docList", dlist);
		model.addAttribute("specList", alist);
		return "home";

	}

	@RequestMapping(value = "/control2", method = RequestMethod.GET)
	public String yyyy(Model model, @RequestParam(name = "doctorId") String doctorId) {
		// System.out.println(doctorId);
		slist = (ArrayList<DocSchedule>) dao.getDoctorSchedule(Integer.parseInt(doctorId));
		ArrayList<SlotDate> slotlist = (ArrayList<SlotDate>) dao.getDateSlots(Integer.parseInt(doctorId));
		model.addAttribute("slotlist", slotlist);
		model.addAttribute("scheduleList", slist);
		model.addAttribute("did", Integer.parseInt(doctorId));
		for (SlotDate ds : slotlist) {
			System.out.println("from " + ds.getAvailable_slots_count());
		}
		return "dates";

	}

	@RequestMapping(value = "/control", method = RequestMethod.GET)
	public String yyy(Model model, @RequestParam(name = "id") String doctorId,
			@RequestParam(name = "date") String date1, @RequestParam(name = "month") String month1) {
		// System.out.println("from ");
		model.addAttribute("scheduleList", slist);
		model.addAttribute("docid", Integer.parseInt(doctorId));
		model.addAttribute("dates", Integer.parseInt(date1));
		model.addAttribute("months", Integer.parseInt(month1));
		System.out.println(doctorId);
		System.out.println(date1);
		System.out.println(month1);

		ArrayList<SlotClass> slotlist = (ArrayList<SlotClass>) dao.getSlots(Integer.parseInt(doctorId));

		ArrayList<SlotClass> slot = new ArrayList<>();
		for (SlotClass e : slotlist) {
			// System.out.println(e.getSlotdoctorid());
			Date da = e.getSlotdate();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = dateFormat.format(da);

			String[] dateParts = formattedDate.split("-");
			int year = Integer.parseInt(dateParts[0]);
			int month = Integer.parseInt(dateParts[1]);
			int day = Integer.parseInt(dateParts[2]);

			if (month == Integer.parseInt(month1) && day == Integer.parseInt(date1)) {
				// System.out.println("ifff");
				slot.add(e);
			}

		}
		// System.out.println(slot.get(0).getSlotstatus());
		model.addAttribute("slot", slot);
		return "slots";

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String yyyy(Model model, @RequestParam(name = "id") String doctorId,
			@RequestParam(name = "from") String from, @RequestParam(name = "to") String to,
			@RequestParam(name = "date") String date1) {
		model.addAttribute("to", to);
		model.addAttribute("docid", doctorId);
		model.addAttribute("dates", date1);
		model.addAttribute("from", from);

		return "reg";

	}

	@RequestMapping(value = "/PatientForm", method = RequestMethod.GET)
	public String submitPatientForm(@ModelAttribute("patient") Patient patient) {
		dao.insertPatient(patient);
		System.out.println(patient.getFrom());
		return "success";

	}

}
