using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class MainForm : Form
    {
        int count = 0;
        Random rnd;

        public MainForm()
        {
            InitializeComponent();
            rnd = new Random();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void tsmiExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void tsmiAboutProgramm_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Программа мои утилиты содержит ряд небольшых программ,\nкоторые могут пригодиться в жизни.\nАвтор Амосов С. Г.", "О программе");
        }

        private void btnPlus_Click(object sender, EventArgs e)
        {
            count++;
            lblCount.Text = count.ToString();
        }

        private void btnminus_Click(object sender, EventArgs e)
        {
            count--;
            lblCount.Text = count.ToString();
        }

        private void btnreset_Click(object sender, EventArgs e)
        {
            count = 0;
            lblCount.Text = count.ToString();
        }

        private void btnRandom_Click(object sender, EventArgs e)
        {
            int n;
            n = rnd.Next(Convert.ToInt32(numericUpDown1.Value), Convert.ToInt32(numericUpDown2.Value));
            lblRandom.Text = n.ToString();
            if (cbRandom.Checked == true)
            {
                if (tbrandom.Text.IndexOf(n.ToString()) == -1) tbrandom.AppendText(n + "\n");
            }
            else tbrandom.AppendText(n + "\n");


        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            tbrandom.Clear();

        }

        private void btnRandomCopy_Click(object sender, EventArgs e)
        {
            Clipboard.SetText(tbrandom.Text);
        }
    }
}
