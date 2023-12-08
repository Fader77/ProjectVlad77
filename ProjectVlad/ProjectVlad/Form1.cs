using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace ProjectVlad
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            textBox2.Text = Properties.Settings.Default.Save_password;
            textBox1.Text = Properties.Settings.Default.Save_login;
        }
        static string connString = @"Data Source=desktop-n74uafj\sqlexpress;Initial Catalog=Marchenko_ISP401;Integrated Security=True";
        SqlConnection sqlConnect = new SqlConnection(connString);
        static string Welcome;
        int Number = 0;

        private async void button1_Click(object sender, EventArgs e)
        {
            try
            {
                Number += 1;
            sqlConnect.Open();
            SqlCommand logRequest = new SqlCommand();
            logRequest.CommandType = CommandType.StoredProcedure;
            logRequest.CommandText = "Data_checking";
            logRequest.Parameters.AddWithValue("@login", textBox1.Text);
            logRequest.Parameters.AddWithValue("@password", textBox2.Text);
            logRequest.Connection = sqlConnect;

            SqlDataReader sqlReader = logRequest.ExecuteReader();
            sqlReader.Read();

            if (sqlReader.HasRows)
            {
                string login = textBox1.Text;
                string sqlQuery = @"SELECT UserPatronymic, UserName, UserSurname FROM Users WHERE Login = @Login";
                using (SqlConnection sqlConnect = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(sqlQuery, sqlConnect))
                    {
                        sqlConnect.Open();
                        SqlParameter nameParam = new SqlParameter("@Login", login);
                        command.Parameters.Add(nameParam);
                        SqlDataReader reader = command.ExecuteReader();
                        reader.Read();
                        Welcome = Welcome + ", " + reader.GetString(2)+ " " + reader.GetString(1) + " " + reader.GetString(0);
                        MessageBox.Show(Welcome);
                        sqlConnect.Close();
                    }
                }

                //MessageBox.Show(Welcome);
                Form2 frm = new Form2();
                frm.Show();
                Hide();
            }
            else
            {
                if (Number != 3)
                {
                    MessageBox.Show("Неверный логин или пароль. Ввод заблокирован на 5 секунд");
                    Turn_off_input();
                    await Task.Delay(5000);
                    Enable_input();
                }
                else if (Number == 3)
                {
                    Captcha frm = new Captcha();
                    frm.ShowDialog();
                    Number = 0;
                }

            }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            sqlConnect.Close();

        }
        private void Turn_off_input()
        {
            textBox1.Enabled = false;
            textBox2.Enabled = false;
            button1.Enabled = false;
        }
        private void Enable_input()
        {
            textBox1.Enabled = true;
            textBox2.Enabled = true;
            button1.Enabled = true;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                if (Properties.Settings.Default.Save_password != "" || Properties.Settings.Default.Save_login != "")
            {
                checkBox1.Checked = true;
            }

            if (DateTime.Now.Hour >= 6 && DateTime.Now.Hour < 12)
            {
                Welcome = "Доброе утро";
            }
            else if (DateTime.Now.Hour >= 12 && DateTime.Now.Hour < 16)
            {
                Welcome = "Добрый день";
            }
            else if (DateTime.Now.Hour >= 16 && DateTime.Now.Hour <= 23)
            {
                Welcome = "Добрый вечер";
            }
            else if (DateTime.Now.Hour >= 0 && DateTime.Now.Hour < 6)
            {
                Welcome = "Доброй ночи";
            }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
                try
                {
                    Properties.Settings.Default.Save_password = textBox2.Text;
            Properties.Settings.Default.Save();

            Properties.Settings.Default.Save_login = textBox1.Text;
            Properties.Settings.Default.Save();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
                    try
                    {
                        MessageBox.Show("Welcom guest");
            Form2 frm = new Form2();
            frm.Show();
            Hide();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
