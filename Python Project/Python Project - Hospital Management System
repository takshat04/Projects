from tkinter import *
import tkinter.messagebox as tkmb
import numpy as np
import pandas as pd
import sqlite3

root = Tk() 
root.geometry("400x400") 
root.title("Welcome to Hospital Management Sys") 
root.config(bg='red')

def Patients_and_Reg():
    new_window = Toplevel()
    new_window.title("Patients Data")
    new_window.geometry("800x500")  

    data_base = 'HospitalManagementSys.db'
    connection = sqlite3.connect(database=data_base)

    cur = connection.cursor()
    cur.execute('Select p.P_ID, p.P_Reg_No, p.Name, p.Gender, r.Date, p.Age, r.Insurance_Covered, r.Total_Charge, r.Paid from Patient p JOIN Registration r ON p.P_Reg_No = r.Reg_No')
    Patients_data = cur.fetchall()
    Patients_data = pd.DataFrame(Patients_data, columns=['P_ID','P_Reg_No','Name','Gender','Date','Age','Insurance_Covered','Total_Charge','Paid'])

    connection.close()
    
    # Create a Text widget
    text_widget = Text(new_window, wrap="none", width=120, height=20)
    
    # Pack the Text widget
    text_widget.pack(side="left", fill="both", expand=True)

    # Insert the data into the Text widget
    text_widget.insert(END, Patients_data.to_string(index=False))

    b3 = Button(new_window, text='Add Patient', bg='black', fg='white', width=15, height=2, font=("NONE", 13), command = add_patient)
    b3.place(x=20, y=420)

    b4 = Button(new_window, text = "Delete Patient", bg='black', fg='white', width=15, height=2, font=("NONE", 13), command = delete_patient)
    b4.place(x = 220, y = 420)

    b5 = Button(new_window, text = "Update Patient", bg='black', fg='white', width=15, height=2, font=("NONE", 13),command = update_patient0)
    b5.place(x = 420, y = 420)

def Patients_and_MedicalRecord():
    new_window = Toplevel()
    new_window.title("Patients' Medical Record Data")
    new_window.geometry("950x500")
    data_base = 'HospitalManagementSys.db'
    connection = sqlite3.connect(database=data_base)

    cur = connection.cursor()
    cur.execute('Select p.P_ID, p.P_Reg_No, p.Name, p.Gender,md.M_No,md.Diagnosed_Date,md.Diagnosed_Disease,md.Ref_Doc from Patient p JOIN Registration r ON p.P_Reg_No = r.Reg_No JOIN Medical_Record md ON r.Reg_No = md.M_Reg_No')
    medrec = cur.fetchall()
    medrec = pd.DataFrame(medrec, columns=['P_ID','P_Reg_No','Name','Gender','M_No','Diagnosed_Date','Diagnosed_Disease','Ref_Doctor'])
    
    # Close the database connection
    connection.close()
    
	# Create a Text widget to display the data
    text_widget = Text(new_window, wrap="none", width=120, height=20)
    text_widget.pack(side="left", fill="both", expand=True)

    # Insert the data into the Text widget
    text_widget.insert(END, medrec.to_string(index=False))

    add_patients_and_medrec_button = Button(new_window, text='Add MedRec', bg='black', fg='white', width=15, height=2, font=("NONE", 13), command=lambda:add_patients_and_medrec(new_window))
    add_patients_and_medrec_button.place(x=20, y=420)

def Doctors():
    new_window = Toplevel()
    new_window.title("Doctors' Data")
    new_window.geometry("800x500")
    data_base = 'HospitalManagementSys.db'
    connection = sqlite3.connect(database=data_base)

    cur = connection.cursor()
    cur.execute('Select * from Doctor')
    medrec = cur.fetchall()
    medrec = pd.DataFrame(medrec, columns=['D_SSN','Name','Gender','Speciality','Age','Salary'])
    
    # Close the database connection
    connection.close()
    
	# Create a Text widget to display the data
    text_widget = Text(new_window, wrap="none", width=120, height=20)
    text_widget.pack(side="left", fill="both", expand=True)

    # Insert the data into the Text widget
    text_widget.insert(END, medrec.to_string(index=False))

    add_doctor_button = Button(new_window, text='Add Doctor', bg='black', fg='white', width=15, height=2, font=("NONE", 13), command=lambda:add_doctor(new_window))
    add_doctor_button.place(x=20, y=420)
    remove_button = Button(new_window,text = "Remove Doctor", bg='black', fg='white', width=15, height=2, font=("NONE", 13), command=lambda:delete_doc(new_window))
    remove_button.place(x=220,y=420)

    update_button = Button(new_window,text="Update Doctor",bg='black', fg='white', width=15, height=2, font=("NONE", 13), command=lambda:update_doc(new_window))
    update_button.place(x=420,y=420)

def Surgeons():
    new_window = Toplevel()
    new_window.title("Surgeons' Data")
    new_window.geometry("800x500")
    data_base = 'HospitalManagementSys.db'
    connection = sqlite3.connect(database=data_base)

    cur = connection.cursor()
    cur.execute('Select d.D_SSN,d.Name,d.Gender,d.Age,d.Salary,s.Surgeon_ID,s.Type,s.Rank from Doctor d JOIN Surgeon s ON d.D_SSN = s.S_D_SSN')
    medrec = cur.fetchall()
    medrec = pd.DataFrame(medrec, columns=['D_SSN','Name','Gender','Age','Salary','Surgeon_ID','Type','Rank'])
    
    # Close the database connection
    connection.close()
    
	# Create a Text widget to display the data
    text_widget = Text(new_window, wrap="none", width=120, height=20)
    text_widget.pack(side="left", fill="both", expand=True)

    # Insert the data into the Text widget
    text_widget.insert(END, medrec.to_string(index=False))

    add_surgeon_button = Button(new_window,text="Add Surgeon", bg="black", fg="white",width=15, height=2, font=("None",13), command=lambda:add_surgeon(new_window))
    add_surgeon_button.place(x=20,y=420)
    remove_button = Button(new_window,text = "Remove Surgeon", bg='black', fg='white', width=15, height=2, font=("NONE", 13), command=lambda:delete_sur(new_window))
    remove_button.place(x=220,y=420)
    update_button = Button(new_window,text="Update Surgeon",bg='black', fg='white', width=15, height=2, font=("NONE", 13), command=lambda:update_sur(new_window))
    update_button.place(x=420,y=420)

def SurgicalPatients():
    new_window = Toplevel()
    new_window.title("Doctors' Data")
    new_window.geometry("630x450")
    data_base = 'HospitalManagementSys.db'
    connection = sqlite3.connect(database=data_base)

    cur = connection.cursor()
    cur.execute('Select * from Surgical_Patient')
    medrec = cur.fetchall()
    medrec = pd.DataFrame(medrec, columns=['SP_No','Date_of_Surgery','Time_of_Surgery','Room_No','Patient_Reg_No','Patient_M_No'])
    
    # Close the database connection
    connection.close()
    
	# Create a Text widget to display the data
    text_widget = Text(new_window, wrap="none", width=120, height=20)
    text_widget.pack(side="left", fill="both", expand=True)

    # Insert the data into the Text widget
    text_widget.insert(END, medrec.to_string(index=False))

    add_SurgecialPatients_button = Button(new_window,text='Add Surgical Patient', bg='black', fg='white', width=18, height=2, font=("None",13), command=lambda:add_SurgecialPatients(new_window))
    add_SurgecialPatients_button.place(x=20,y=360)

def login():
    username = user_entry.get()
    password = e1_str.get()
    p_id = id_entry.get()

    if username == '' or password == '':
        message.set("Fill the empty fields!!!")
    elif username == 'ProjectHMS' and password != '12345':
        message.set("Wrong Password")
    elif username != 'ProjectHMS' and password == '12345':
        message.set("Wrong Username")
    elif username != 'ProjectHMS' and password != '12345':
        message.set("Wrong Username and Password")
    else:
        message.set("Login Successful")
        open_main_window()

def my_show():
    if(c_v1.get()==1):
        e1.config(show='')
    else:
        e1.config(show='*')


def open_main_window():
        # Open a new window to display the data
        new_window = Toplevel() 
        new_window.title("Select Window") 
        new_window.geometry("500x500")
        new_window.config(bg='red')

        Label(new_window,text="Select the data set you wish to view: ",font=("None",15),bg='red',fg='black').place(x=75,y=10)

        display_Patients_and_Reg = Button(new_window,text='Patients_registration_data', bg='black', fg='white',width=50,height=2,font=("None",13), command=Patients_and_Reg).place(x=20, y=50)

        display_Patients_and_MedicalRecord = Button(new_window,text='Patients_MedicalRecord', bg='black', fg='white',width=50,height=2,font=("None",13), command=Patients_and_MedicalRecord).place(x=20,y=110)

        display_Doctors = Button(new_window,text="Doctors'_Data", bg='black', fg='white',width=50,height=2,font=("None",13),command=Doctors).place(x=20,y=170)

        display_Surgeons = Button(new_window,text="Surgeons'_Data", bg='black', fg='white',width=50,height=2,font=("None",13),command=Surgeons).place(x=20,y=230)

        display_SurgicalPatients = Button(new_window,text='SurgicalPatient_records', bg='black', fg='white',width=50,height=2,font=("None",13),command=SurgicalPatients).place(x=20,y=290)

root.geometry('600x400')
root.title('Login Page')
# root.config(bg="black")

global message
message = StringVar()
global user_entry 
user_entry = StringVar()

global id_entry
id_entry = StringVar()
global reg_no_entry
reg_no_entry = StringVar()
global name_entry
name_entry = StringVar()
global age_entry
age_entry = StringVar()
global gender_entry
gender_entry = StringVar()
global date_entry
date_entry = StringVar()
global insurance_covered_entry
insurance_covered_entry = StringVar()
global total_charge_entry
total_charge_entry = StringVar()
global paid_entry
paid_entry = StringVar()

global doctor_ssn_entry
doctor_ssn_entry = StringVar()
global doctor_name_entry
doctor_name_entry = StringVar()
global doctor_gender_entry
doctor_gender_entry = StringVar()
global doctor_speciality_entry
doctor_speciality_entry = StringVar()
global doctor_age_entry
doctor_age_entry = StringVar()
global doctor_salary_entry
doctor_salary_entry = StringVar()

global surgeon_ssn_entry
surgeon_ssn_entry = StringVar()
global surgeon_name_entry
surgeon_name_entry = StringVar()
global surgeon_gender_entry
surgeon_gender_entry = StringVar()
global surgeon_age_entry
surgeon_age_entry = StringVar()
global surgeon_salary_entry
surgeon_salary_entry = StringVar()
global surgeon_id_entry
surgeon_id_entry = StringVar()
global surgeon_type_entry
surgeon_type_entry = StringVar()
global surgeon_rank_entry
surgeon_rank_entry = StringVar()

global doctor_delete_id
doctor_delete_id = StringVar()
global doctor_delete_name
doctor_delete_name = StringVar()

global patient_delete_id
patient_delete_id = StringVar()
global patient_delete_name
patient_delete_name = StringVar()

global surgeon_delete_id
surgeon_delete_id = StringVar()
global surgeon_delete_name
surgeon_delete_name = StringVar()

global reg_no1_entry
reg_no1_entry = StringVar()
global mno_entry
mno_entry = StringVar()
global dd_entry
dd_entry = StringVar()
global ddate_entry
ddate_entry = StringVar()
global rd_entry
rd_entry = StringVar()

global sp_no_entry
sp_no_entry = StringVar()
global dos_entry
dos_entry = StringVar()
global ts_entry
ts_entry = StringVar()
global room_no_entry
room_no_entry = StringVar()
global sp_reg_entry
sp_reg_entry = StringVar()
global sp_mno_entry
sp_mno_entry = StringVar()

global e1_str
e1_str=StringVar() 
global c_v1
c_v1=IntVar(value=0)

global column
column = StringVar()
global old
old = StringVar()
global new
new = StringVar()

global p_column
p_column = StringVar()
global p_old
p_old = StringVar()
global p_new
p_new = StringVar()

Label(root,text="Mordern Login System UI",font=("None",20),bg='red').place(x=125,y=10)
Label(root, text='UserName:',font=("Arial",15),bg='red').place(x=40,y=60)
Entry(root, textvariable=user_entry,width=20,font=("NONE",15),bg='black',fg='white').place(x=150,y=65)
Label(root, text='Password:',font=("Arial",15),bg='red').place(x=40,y=120)
e1 = Entry(root,font=("Arial",15),show='*',textvariable=e1_str,bg='black',fg='white')
e1.place(x=150,y=120)
c1 = Checkbutton(root,text='Show Password',variable=c_v1,font=("NONE",10),bg='red',onvalue=1,offvalue=0,command=my_show)
c1.place(x=375,y=120)   

b1 = Button(root, text='Login', bg='black', fg='white',width=8,height=2,font=("NONE",13) ,command=login)
b1.place(x=45, y=180)
l1 = Label(root, text="",textvariable=message,font=("NONE",13),bg='red')
l1.place(x=150,y=160)

def add_patient():
    new_window = Toplevel()
    new_window.title("Patient Registration Form")
    new_window.geometry("600x600")

    Label(new_window, text="Patient Details' Registration Form", font=("None", 18)).place(x=75, y=50)

    Label(new_window, text="Patient ID:", font=("Arial", 12)).place(x=20, y=150)
    Entry(new_window, textvariable=id_entry, width=20, font=("Arial", 15)).place(x=180, y=150)

    Label(new_window, text="Patient Register No. :", font=("Arial", 12)).place(x=20, y=190)
    Entry(new_window, textvariable=reg_no_entry, width=20, font=("Arial", 15)).place(x=180, y=190)

    Label(new_window, text="Patient Name :", font=("Arial", 12)).place(x=20, y=230)
    Entry(new_window, textvariable=name_entry, width=20, font=("Arial", 15)).place(x=180, y=230)

    Label(new_window, text="Patient Gender :", font=("Arial", 12)).place(x=20, y=270)
    Entry(new_window, textvariable=gender_entry, width=20, font=("Arial", 15)).place(x=180, y=270)

    Label(new_window, text="Patient Age :", font=("Arial", 12)).place(x=20, y=310)
    Entry(new_window, textvariable=age_entry, width=20, font=("Arial", 15)).place(x=180, y=310)

    Label(new_window, text="Patient Admit date :", font=("Arial", 12)).place(x=20, y=350)
    Entry(new_window, textvariable=date_entry, width=20, font=("Arial", 15)).place(x=180, y=350)

    Label(new_window, text="Patient Insurance? :", font=("Arial", 12)).place(x=20, y=390)
    Entry(new_window, textvariable=insurance_covered_entry, width=20, font=("Arial", 15)).place(x=180, y=390)

    Label(new_window, text="Patient Total Charge :", font=("Arial", 12)).place(x=20, y=430)
    Entry(new_window, textvariable=total_charge_entry, width=20, font=("Arial", 15)).place(x=180, y=430)

    Label(new_window, text="Bill Paid Amt. :", font=("Arial", 12)).place(x=20, y=470)
    Entry(new_window, textvariable=paid_entry, width=20, font=("Arial", 15)).place(x=180, y=470)

    b2 = Button(new_window, text='Submit', bg='black', fg='red', width=15, height=2, font=("NONE", 13), command=lambda:submit_patient(new_window))
    b2.place(x=170, y=530)

def delete_patient():
    new_window = Toplevel()
    new_window.title("Deletion of Patient's Data")
    new_window.geometry("450x450")

    Label(new_window, text = "Delete Patient ID :",font = ("Arial",12)).place(x=20,y=170)
    Entry(new_window, textvariable=patient_delete_id,width = 20, font=("Arial",15)).place(x=190,y=170)

    Label(new_window, text = "Delete Patient Name :",font = ("Arial",12)).place(x=20,y=215)
    Entry(new_window, textvariable=patient_delete_name,width = 20, font=("Arial",15)).place(x=190,y=215)

    b35 = Button(new_window, text='Submit', bg='black', fg='red', width=15, height=2, font=("NONE", 13), command=lambda:delete_patient2(new_window))
    b35.place(x=122, y=320)

def update_patient0():
    new_window = Toplevel()
    new_window.title("Updation of Patient's Data")
    new_window.geometry("475x475")

    Label(new_window, text = "Reg_NO :",font = ("Arial",12)).place(x=20,y=150)
    Entry(new_window, textvariable=p_column,width = 20, font=("Arial",15)).place(x=150,y=150)

    Label(new_window, text = "Update column :",font = ("Arial",12)).place(x=20,y=200)
    Entry(new_window, textvariable=p_old,width = 20, font=("Arial",15)).place(x=150,y=200)

    Label(new_window, text = "New value :",font = ("Arial",12)).place(x=20,y=250)
    Entry(new_window, textvariable=p_new,width = 20, font=("Arial",15)).place(x=150,y=250)

    b39 = Button(new_window, text='Submit', bg='black', fg='red', width=15, height=2, font=("NONE", 13), command=lambda:update_patient(new_window))
    b39.place(x=150, y=350)

def submit_patient(new_window):
    p_id = id_entry.get()
    reg_no = reg_no_entry.get()
    name = name_entry.get()
    gender = gender_entry.get()
    age = age_entry.get()
    date = date_entry.get()
    insurance_covered = insurance_covered_entry.get()
    total_charge = total_charge_entry.get()
    paid = paid_entry.get()

    if not all([p_id, reg_no, name, gender, age, date, insurance_covered, total_charge, paid]):
        # Display an error message or handle invalid input
        tkmb.showerror("Error", "All fields must be filled")
        return

    data_base = 'HospitalManagementSys.db'
    connection = sqlite3.connect(database=data_base)
    cur = connection.cursor()

    cur.execute("INSERT INTO Patient (P_ID, P_Reg_No, Name, Gender, Age) VALUES (?, ?, ?, ?, ?)",(p_id, reg_no, name, gender, age))
    cur.execute("INSERT INTO Registration (Reg_No, Date, Insurance_Covered, Total_Charge, Paid) VALUES (?, ?, ?, ?, ?)",(reg_no, date, insurance_covered,total_charge, paid))

    connection.commit()

    tkmb.showinfo("Success", "Patient details added successfully!")

    connection.close()
    new_window.destroy()

def delete_patient2(prev_window):
    del_name = patient_delete_name.get()
    del_id = patient_delete_id.get()

    if not all([del_name,del_id]):
        # Display an error message or handle invalid input
        tkmb.showerror("Error", "All fields must be filled")
        return
    
    data_base = "HospitalManagementSys.db"
    connection = sqlite3.connect(database = data_base)
    cur = connection.cursor()

    cur.execute("DELETE FROM Patient WHERE Name = (?) AND P_ID = (?)",(del_name,del_id))
    connection.commit()
    
    tkmb.showinfo("Success", "Patient details deleted successfully!")
    connection.close()
    prev_window.destroy()

def update_patient(prev_window):
    column_2 = p_column.get()
    old_2 = p_old.get()
    new_2 = p_new.get()

    if not all([column_2,old_2,new_2]):
        # Display an error message or handle invalid input
        tkmb.showerror("Error", "All fields must be filled")
        return
    
    data_base = "HospitalManagementSys.db"
    connection = sqlite3.connect(database = data_base)
    cur = connection.cursor()

    cur.execute("UPDATE Patient SET {} = (?) WHERE P_ID = (?)".format(old_2),(new_2,column_2))
    connection.commit()
    
    tkmb.showinfo("Success", "Patient details updated successfully!")
    connection.close()
    prev_window.destroy()

def add_patients_and_medrec(prev_window):
    prev_window.destroy()
    new_window = Toplevel()
    new_window.title("Patients' Medical Record Form")
    new_window.geometry("600x500")

    Label(new_window, text="Patients' Medical Record Registration Form", font=("None", 18)).place(x=75, y=50)

    Label(new_window, text="Patient Registration No.:", font=("Arial", 12)).place(x=20, y=150)
    Entry(new_window, textvariable=reg_no1_entry, width=20, font=("Arial", 15)).place(x=245, y=150)

    Label(new_window, text="Patient M_No.:", font=("Arial", 12)).place(x=20, y=200)
    Entry(new_window, textvariable=mno_entry, width=20, font=("Arial", 15)).place(x=245, y=200)

    Label(new_window, text="Patient Diagnosed Date:", font=("Arial", 12)).place(x=20, y=250)
    Entry(new_window, textvariable=dd_entry, width=20, font=("Arial", 15)).place(x=245, y=250)

    Label(new_window, text="Patient Diagnosed Disease:", font=("Arial", 12)).place(x=20, y=300)
    Entry(new_window, textvariable=ddate_entry, width=20, font=("Arial", 15)).place(x=245, y=300)

    Label(new_window, text="Patient's Ref. Doctor:", font=("Arial", 12)).place(x=20, y=350)
    Entry(new_window, textvariable=rd_entry, width=20, font=("Arial", 15)).place(x=245, y=350)

    b2 = Button(new_window, text='Submit', bg='black', fg='red', width=15, height=2, font=("NONE", 13), command=lambda:submit_patients_and_medrec(prev_window))
    b2.place(x=150, y=420)

def submit_patients_and_medrec(prev_window):
    p_reg_no1 = reg_no1_entry.get()
    p_mno = mno_entry.get()
    p_ddate = ddate_entry.get()
    p_dd = dd_entry.get()
    p_rd = rd_entry.get()

    data_base = 'HospitalManagementSys.db'
    connection = sqlite3.connect(database=data_base)
    cur = connection.cursor()

    try:
        cur.execute("INSERT INTO Medical_Record (M_Reg_No, M_No, Diagnosed_Date, Diagnosed_Disease, Ref_Doc) VALUES (?, ?, ?, ?, ?)",(p_reg_no1, p_mno, p_ddate, p_dd, p_rd))

        connection.commit()

        tkmb.showinfo("Success", "Patients' Medical Record details added successfully!")
        prev_window.destroy()

    except Exception as e:
        tkmb.showerror("Error", f"Error inserting data: {str(e)}")

    finally:
        connection.close()

def add_doctor(prev_window):
    prev_window.destroy()
    new_window = Toplevel()
    new_window.title("Doctor Registration Form")
    new_window.geometry("600x600")

    Label(new_window, text="Doctor Details' Registration Form", font=("None", 18)).place(x=75, y=50)

    Label(new_window, text="Doctor SSN:", font=("Arial", 12)).place(x=20, y=150)
    Entry(new_window, textvariable=doctor_ssn_entry, width=20, font=("Arial", 15)).place(x=180, y=150)

    Label(new_window, text="Doctor Name:", font=("Arial", 12)).place(x=20, y=190)
    Entry(new_window, textvariable=doctor_name_entry, width=20, font=("Arial", 15)).place(x=180, y=190)

    Label(new_window, text="Doctor Gender:", font=("Arial", 12)).place(x=20, y=230)
    Entry(new_window, textvariable=doctor_gender_entry, width=20, font=("Arial", 15)).place(x=180, y=230)

    Label(new_window, text="Doctor Age:", font=("Arial", 12)).place(x=20, y=270)
    Entry(new_window, textvariable=doctor_age_entry, width=20, font=("Arial", 15)).place(x=180, y=270)

    Label(new_window, text="Doctor Speciality:", font=("Arial", 12)).place(x=20, y=310)
    Entry(new_window, textvariable=doctor_speciality_entry, width=20, font=("Arial", 15)).place(x=180, y=310)

    Label(new_window, text="Doctor Salary:", font=("Arial", 12)).place(x=20, y=350)
    Entry(new_window, textvariable=doctor_salary_entry, width=20, font=("Arial", 15)).place(x=180, y=350)

    b2 = Button(new_window, text='Submit', bg='black', fg='red', width=15, height=2, font=("NONE", 13), command=lambda:submit_doctor(new_window))
    b2.place(x=150, y=420)

def delete_doc(prev_window):
    prev_window.destroy()
    new_window = Toplevel()
    new_window.title("Deletion of Doc's Data")
    new_window.geometry("500x500")

    Label(new_window, text = "Delete Doctor's ID :",font = ("Arial",12)).place(x=20,y=150)
    Entry(new_window, textvariable=doctor_delete_id,width = 20, font=("Arial",15)).place(x=190,y=150)

    Label(new_window, text = "Delete Doctor's Name :",font = ("Arial",12)).place(x=20,y=200)
    Entry(new_window, textvariable=doctor_delete_name,width = 20, font=("Arial",15)).place(x=190,y=200)

    b3 = Button(new_window, text='Submit', bg='black', fg='red', width=15, height=2, font=("NONE", 13), command=lambda:delete_doctor(new_window))
    b3.place(x=150, y=300)

def delete_doctor(prev_window):
    del_name = doctor_delete_name.get()
    del_id = doctor_delete_id.get()

    if not all([del_name,del_id]):
        tkmb.showerror("Error", "All fields must be filled")
        return
    
    data_base = "HospitalManagementSys.db"
    connection = sqlite3.connect(database = data_base)
    cur = connection.cursor()

    cur.execute("DELETE FROM Doctor WHERE Name = (?) AND D_SSN = (?)",(del_name,del_id))
    connection.commit()
    
    tkmb.showinfo("Success", "Doctor details deleted successfully!")
    connection.close()
    prev_window.destroy()    

def update_doc(prev_window):
    prev_window.destroy()
    new_window = Toplevel()
    new_window.title("updation of Doc's Data")
    new_window.geometry("500x400")

    Label(new_window,text="D_SSN :",font = ("Arial",12)).place(x=20,y=100)
    Entry(new_window, textvariable=column,width = 20, font=("Arial",15)).place(x=190,y=100)

    Label(new_window, text = "Column To Update :",font = ("Arial",12)).place(x=20,y=150)
    Entry(new_window, textvariable=old,width = 20, font=("Arial",15)).place(x=190,y=150)

    Label(new_window, text = "New value :",font = ("Arial",12)).place(x=20,y=200)
    Entry(new_window, textvariable=new,width = 20, font=("Arial",15)).place(x=190,y=200)

    b34 = Button(new_window, text='Submit', bg='black', fg='red', width=15, height=2, font=("NONE", 13), command=lambda:update_doctor(new_window))
    b34.place(x=150, y=320)

def update_doctor(prev_window):
    column_1 = column.get()
    old_1 = old.get()
    new_1 = new.get()

    if not all([column_1,old_1,new_1]):
        # Display an error message or handle invalid input
        tkmb.showerror("Error", "All fields must be filled")
        return
    
    data_base = "HospitalManagementSys.db"
    connection = sqlite3.connect(database = data_base)
    cur = connection.cursor()

    cur.execute("UPDATE Doctor SET {} = (?) WHERE D_SSN = (?)".format(old_1),(new_1,column_1))
    connection.commit()
    

    tkmb.showinfo("Success", "Doctor details updated successfully!")
    connection.close()
    prev_window.destroy()

def submit_doctor(new_window):
    doctor_ssn = doctor_ssn_entry.get()
    doctor_name = doctor_name_entry.get()
    doctor_gender = doctor_gender_entry.get()
    doctor_speciality = doctor_speciality_entry.get()
    doctor_age = doctor_age_entry.get()
    doctor_salary = doctor_salary_entry.get()

    if not all([doctor_ssn, doctor_name, doctor_gender, doctor_speciality, doctor_age, doctor_salary]):
        # Display an error message or handle invalid input
        tkmb.showerror("Error", "All fields must be filled")
        return

    data_base = 'HospitalManagementSys.db'
    connection = sqlite3.connect(database=data_base)
    cur = connection.cursor()

    cur.execute("INSERT INTO Doctor (D_SSN, Name, Gender, Speciality, Age, Salary) VALUES (?, ?, ?, ?, ?, ?)",(doctor_ssn, doctor_name, doctor_gender, doctor_speciality, doctor_age, doctor_salary))

    connection.commit()

    tkmb.showinfo("Success", "Doctor details added successfully!")

    connection.close()
    new_window.destroy()
    
def add_surgeon(prev_window):
    prev_window.destroy()
    new_window = Toplevel()
    new_window.title("Surgeon Registration Form")
    new_window.geometry("600x600")

    Label(new_window, text="Surgeon Details' Registration Form", font=("None", 18)).place(x=75, y=50)

    Label(new_window, text="Surgeon SSN :", font=("Arial", 12)).place(x=20, y=150)
    Entry(new_window, textvariable=surgeon_ssn_entry, width=20, font=("Arial", 15)).place(x=180, y=150)

    Label(new_window, text="Surgeon Name :", font=("Arial", 12)).place(x=20, y=190)
    Entry(new_window, textvariable=surgeon_name_entry, width=20, font=("Arial", 15)).place(x=180, y=190)

    Label(new_window, text="Surgeon Gender :", font=("Arial", 12)).place(x=20, y=230)
    Entry(new_window, textvariable=surgeon_gender_entry, width=20, font=("Arial", 15)).place(x=180, y=230)

    Label(new_window, text="Surgeon Age :", font=("Arial", 12)).place(x=20, y=270)
    Entry(new_window, textvariable=surgeon_age_entry, width=20, font=("Arial", 15)).place(x=180, y=270)

    Label(new_window, text="Surgeon Salary :", font=("Arial", 12)).place(x=20, y=310)
    Entry(new_window, textvariable=surgeon_salary_entry, width=20, font=("Arial", 15)).place(x=180, y=310)

    Label(new_window, text="Surgeon ID :", font=("Arial", 12)).place(x=20, y=350)
    Entry(new_window, textvariable=surgeon_id_entry, width=20, font=("Arial", 15)).place(x=180, y=350)

    Label(new_window, text="Surgeon Type :", font=("Arial", 12)).place(x=20, y=390)
    Entry(new_window, textvariable=surgeon_type_entry, width=20, font=("Arial", 15)).place(x=180, y=390)

    Label(new_window, text="Surgeon Rank :", font=("Arial", 12)).place(x=20, y=430)
    Entry(new_window, textvariable=surgeon_rank_entry, width=20, font=("Arial", 15)).place(x=180, y=430)

    b2 = Button(new_window, text='Submit', bg='black', fg='red', width=15, height=2, font=("NONE", 13), command=lambda:submit_surgeon_and_doctor(new_window))
    b2.place(x=150, y=490)

def submit_surgeon_and_doctor(prev_window):
    surgeon_ssn = surgeon_ssn_entry.get()
    surgeon_name = surgeon_name_entry.get()
    surgeon_gender = surgeon_gender_entry.get()
    surgeon_age = surgeon_age_entry.get()
    surgeon_salary = surgeon_salary_entry.get()
    surgeon_id = surgeon_id_entry.get()
    surgeon_type = surgeon_type_entry.get()
    surgeon_rank = surgeon_rank_entry.get()

    if not all([surgeon_ssn, surgeon_id, surgeon_type, surgeon_rank]):
        tkmb.showerror("Error", "All fields must be filled")
        return

    data_base = 'HospitalManagementSys.db'
    connection = sqlite3.connect(database=data_base)
    cur = connection.cursor()

    cur.execute("INSERT INTO Surgeon (S_D_SSN, Surgeon_ID, Type, Rank) VALUES (?, ?, ?, ?)",(surgeon_ssn, surgeon_id, surgeon_type, surgeon_rank))

    connection.commit()

    cur.execute("INSERT INTO Doctor (D_SSN, Name, Gender, Age, Salary, Speciality) VALUES (?, ?, ?, ?, ?, ?)",(surgeon_ssn, surgeon_name, surgeon_gender, surgeon_age, surgeon_salary, surgeon_type))

    connection.commit()

    tkmb.showinfo("Success", "Surgeon details added successfully!")

    connection.close()
    prev_window.destroy()

def delete_sur(prev_window):
    prev_window.destroy()
    new_window = Toplevel()
    new_window.title("Deletion of Surgeons' Data")
    new_window.geometry("500x400")

    Label(new_window, text = "Delete Surgeon SSN :",font = ("Arial",12)).place(x=20,y=150)
    Entry(new_window, textvariable=surgeon_delete_id,width = 20, font=("Arial",15)).place(x=190,y=150)

    b34 = Button(new_window, text='Submit', bg='black', fg='red', width=15, height=2, font=("NONE", 13), command=lambda:delete_surgeon(new_window))
    b34.place(x=150, y=320)

def delete_surgeon(prev_window):
    del_id = surgeon_delete_id.get()

    if not all([del_id]):
        # Display an error message or handle invalid input
        tkmb.showerror("Error", "All fields must be filled")
        return
    
    data_base = "HospitalManagementSys.db"
    connection = sqlite3.connect(database = data_base)
    cur = connection.cursor()

    cur.execute("DELETE FROM Surgeon WHERE S_D_SSN = (?)",(del_id,))
    connection.commit()
    

    tkmb.showinfo("Success", "Surgeon details deleted successfully!")
    connection.close()
    prev_window.destroy()

def update_sur(prev_window):
    prev_window.destroy()
    new_window = Toplevel()
    new_window.title("Updation of Surgeon's Data")
    new_window.geometry("500x450")

    Label(new_window,text="Surgeon SSN :",font = ("Arial",12)).place(x=20,y=100)
    Entry(new_window, textvariable=column,width = 20, font=("Arial",15)).place(x=190,y=100)

    Label(new_window, text = "Column To Update :",font = ("Arial",12)).place(x=20,y=150)
    Entry(new_window, textvariable=old,width = 20, font=("Arial",15)).place(x=190,y=150)

    Label(new_window, text = "New value :",font = ("Arial",12)).place(x=20,y=200)
    Entry(new_window, textvariable=new,width = 20, font=("Arial",15)).place(x=190,y=200)

    b34 = Button(new_window, text='Submit', bg='black', fg='red', width=15, height=2, font=("NONE", 13), command=lambda:update_surgeon(new_window))
    b34.place(x=150, y=320)

def update_surgeon(prev_window):
    column_1 = column.get()
    old_1 = old.get()
    new_1 = new.get()

    if not all([column_1,old_1,new_1]):
        # Display an error message or handle invalid input
        tkmb.showerror("Error", "All fields must be filled")
        return
    
    data_base = "HospitalManagementSys.db"
    connection = sqlite3.connect(database = data_base)
    cur = connection.cursor()

    cur.execute("UPDATE Surgeon SET {} = (?) WHERE S_D_SSN = (?)".format(old_1),(new_1,column_1))
    connection.commit()
    

    tkmb.showinfo("Success", "surgeon details updated successfully!")
    connection.close()
    prev_window.destroy()

def add_SurgecialPatients(prev_window):
    prev_window.destroy()
    new_window = Toplevel()
    new_window.title("Patients' Sergical Record Form")
    new_window.geometry("550x550")

    Label(new_window, text="Patients' Surgical Record Registration Form", font=("None", 18)).place(x=45, y=50)

    Label(new_window, text="Surgical Patient No.:", font=("Arial", 12)).place(x=20, y=150)
    Entry(new_window, textvariable=sp_no_entry, width=20, font=("Arial", 15)).place(x=180, y=150)

    Label(new_window, text="Date of Surgery:", font=("Arial", 12)).place(x=20, y=190)
    Entry(new_window, textvariable=dos_entry, width=20, font=("Arial", 15)).place(x=180, y=190)

    Label(new_window, text="Time Of Surgery:", font=("Arial", 12)).place(x=20, y=230)
    Entry(new_window, textvariable=ts_entry, width=20, font=("Arial", 15)).place(x=180, y=230)

    Label(new_window, text="Patient Room No.:", font=("Arial", 12)).place(x=20, y=270)
    Entry(new_window, textvariable=room_no_entry, width=20, font=("Arial", 15)).place(x=180, y=270)

    Label(new_window, text="Patient's Reg. No.:", font=("Arial", 12)).place(x=20, y=310)
    Entry(new_window, textvariable=sp_reg_entry, width=20, font=("Arial", 15)).place(x=180, y=310)

    Label(new_window, text="Patient's M_No.:", font=("Arial", 12)).place(x=20, y=350)
    Entry(new_window, textvariable=sp_mno_entry, width=20, font=("Arial", 15)).place(x=180, y=350)

    b2 = Button(new_window, text='Submit', bg='black', fg='red', width=15, height=2, font=("NONE", 13), command=lambda:submit_SurgicalPatients(prev_window))
    b2.place(x=100, y=450)

def submit_SurgicalPatients(prev_window):
    sp_no = sp_no_entry.get()
    dos = dos_entry.get()
    ts = ts_entry.get()
    room_no = room_no_entry.get()
    sp_reg = sp_reg_entry.get()
    sp_mno = sp_mno_entry.get()

    data_base = 'HospitalManagementSys.db'
    connection = sqlite3.connect(database=data_base)
    cur = connection.cursor()

    try:
        cur.execute("INSERT INTO Surgical_Patient (SP_No, Date_Of_Surgery, Time_Of_Surgery, Room_No, S_Reg_No, S_M_No) VALUES(?, ?, ?, ?, ?, ?)",(sp_no,dos,ts,room_no,sp_reg,sp_mno))

        connection.commit()

        tkmb.showinfo("Success", "Patients' Surgical Record details added successfully!")
        prev_window.destroy()

    except Exception as e:
        tkmb.showerror("Error", f"Error inserting data: {str(e)}")

    finally:
        connection.close()

mainloop()
