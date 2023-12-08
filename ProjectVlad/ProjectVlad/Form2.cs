using Microsoft.SqlServer.Server;
using ProjectVlad.Properties;
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
    public partial class Form2 : Form
    {
        static string connString = "Data Source=desktop-n74uafj\\sqlexpress;Initial Catalog=Marchenko_ISP401;Integrated Security=True";
        SqlConnection sqlConnect = new SqlConnection(connString);
        public Form2()
        {
            InitializeComponent(); 
           

        }
        
        private void Form2_Load(object sender, EventArgs e)
        {
            try
            {
                // TODO: данная строка кода позволяет загрузить данные в таблицу "marchenko_ISP401DataSet2.View_111". При необходимости она может быть перемещена или удалена.
                this.view_111TableAdapter.Fill(this.marchenko_ISP401DataSet2.View_111);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            //foreach (DataGridViewRow row in dataGridView1.Rows)
            //  if (Convert.ToInt32(row.Cells[8].Value) > 3)//проверка скидки каждого продукта
            //{
            //  row.DefaultCellStyle.BackColor = System.Drawing.Color.FromArgb(((int)(byte)(127)), ((int)(byte)(255)), ((int)(byte)(0)));
            //}
        }


        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            try
            {
                BindingSource bs = new BindingSource();
                bs.DataSource = dataGridView1.DataSource;
                bs.Filter = $"Название LIKE '%{textBox1.Text}%'";
                dataGridView1.DataSource = bs;


                //(dataGridView1.DataSource as DataTable).DefaultView.RowFilter = $"ProductName LIKE '%{textBox1.Text}%'";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (e.RowIndex != null & e.RowIndex != -1)
                {
                    DataGridViewRow productdata = dataGridView1.Rows[e.RowIndex];
                    label5.Text = productdata.Cells[10].Value.ToString();
                    label6.Text = productdata.Cells[6].Value.ToString();
                    label7.Text = productdata.Cells[3].Value.ToString();
                    label8.Text = productdata.Cells[8].Value.ToString() + "%";
                    if (productdata.Cells[11].Value.ToString() != "")
                    {
                        //string imagename = Resurces
                        String imagename = "F:\\4 курс, Шляпкин А.А\\ProjectVlad\\ProjectVlad\\ProjectVlad\\photo\\" + productdata.Cells[11].Value.ToString();
                        pictureBox1.Image = Image.FromFile(imagename);
                        
                    }

                    else
                    {
                        String imagename = "F:\\4 курс, Шляпкин А.А\\ProjectVlad\\ProjectVlad\\ProjectVlad\\photo\\logo.png";
                        pictureBox1.Image = Image.FromFile(imagename);
                    }

                }


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                switch (comboBox1.SelectedIndex)
                {
                    case 0:
                        (dataGridView1.DataSource as DataTable).DefaultView.RowFilter = "";
                        break;
                    case 1:
                        (dataGridView1.DataSource as DataTable).DefaultView.RowFilter = $"Скидка < 10";
                        break;
                    case 2:
                        (dataGridView1.DataSource as DataTable).DefaultView.RowFilter = $"Скидка <= 10 and Скидка => 15 ";
                        break;
                    case 3:
                        (dataGridView1.DataSource as DataTable).DefaultView.RowFilter = $"Скидка > 15";
                        break;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            /*
            try
            {
                string DiscountText = comboBox1.SelectedItem.ToString();

                if (DiscountText == "все диапозоны")
                {
                    SqlConnection sqlConnect = new SqlConnection(connString);
                    DataSet ds = new DataSet();
                    SqlCommand cmd = new SqlCommand();

                    cmd.CommandText = $"Select * FROM View_111";
                    cmd.CommandText = connString;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(ds);
                    int cnt_rows = 0;
                    cnt_rows = ds.Tables[0].Rows.Count;

                    dataGridView1.DataSource = ds.Tables[0];
                    sqlConnect.Close();
                }
                else if (DiscountText == "0-9,99%")
                {
                    SqlConnection sqlConnect = new SqlConnection(connString);
                    DataSet ds = new DataSet();
                    SqlCommand cmd = new SqlCommand();

                    cmd.CommandText = $"Select * FROM View_111 where Скидка < 10";
                    cmd.CommandText = connString;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(ds);
                    int cnt_rows = 0;
                    cnt_rows = ds.Tables[8].Rows.Count;

                    dataGridView1.DataSource = ds.Tables[8];
                    sqlConnect.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }*/
        }

        private void dataGridView1_RowPrePaint(object sender, DataGridViewRowPrePaintEventArgs e)
        {
            /*if (dataGridView1.Rows[e.RowIndex].Cells[0].Value != DBNull.Value)
            {
                int valu = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[6].Value);

            }
            if( valu > 3)
            {
                dataGridView1.Rows[e.RowIndex].DefaultCellStyle.BackColor = C;
            }*/
            
        }
    }
}
