//
//  DoctorDAO.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/03/23.
//

import Foundation


struct DoctorDAO{
    
    func add(doctor : Doctor){
        Storage.storage.doctorList[doctor.employeeId] = doctor
    }
    
    func getDoctor(doctorId : String )->Doctor?{
        return Storage.storage.doctorList[doctorId]
    }
    
    func getAvailableDoctors(on date : Date)->  [DoctorAvailability]?{
        return Storage.storage.availableDoctors[dateFormat(date: date)]
    }
    
    func update(doctor : Doctor){
        Storage.storage.doctorList[doctor.employeeId] = doctor
        
    }
    func isDoctorExist(doctorId : String)->Bool{
        return Storage.storage.doctorList.contains(where: {$0.key == doctorId})
    }
    
    func removeDoctor(doctorId : String ){
       Storage.storage.doctorList.removeValue(forKey: doctorId)
    }
    
    func getAllDoctors()->[Doctor]?{
        return Array(Storage.storage.doctorList.values)
    }
    
    func getDoctor(name : String)->Doctor?{
        
        let allDoctors = Array(Storage.storage.doctorList.values)
        
        for doctor in allDoctors{
            if(doctor.name.caseInsensitiveCompare(name) == .orderedSame){
                return doctor
            }
        }
        return nil
    }
    
    func changeDoctorAvailability(date : Date ,doctors : [DoctorAvailability]){
        Storage.storage.availableDoctors[dateFormat(date: date)] = doctors
    }
    
    func updateDoctorAvailability(date: Date ,doctorAvailability : [DoctorAvailability]){
        Storage.storage.availableDoctors[dateFormat(date: date)] = doctorAvailability
    }
    
    func getAvailableDoctors(on date:Date , in department : Department)->[DoctorAvailability]?{
        var availableDoctors = [DoctorAvailability]()
        
        guard let availableDoctorsOnSpecifiedDate = Storage.storage.availableDoctors[dateFormat(date: date)] else {
            return nil
        }
        
        for doctor in availableDoctorsOnSpecifiedDate{
            if (doctor.department == department && doctor.isAvailable == true){
                availableDoctors.append(doctor)
            }
        }
        return availableDoctors.count != 0 ? availableDoctors : nil
    }
    
    
    
  
}

func dateFormat(date : Date)->String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
   return dateFormatter.string(from: date)
}