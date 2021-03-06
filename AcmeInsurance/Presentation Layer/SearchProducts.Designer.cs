﻿namespace AcmeInsurance.Presentation_Layer
{
    partial class frmSearchProducts
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmSearchProducts));
            this.rbPremium = new System.Windows.Forms.RadioButton();
            this.rbProductType = new System.Windows.Forms.RadioButton();
            this.rbAll = new System.Windows.Forms.RadioButton();
            this.btnSearch = new System.Windows.Forms.Button();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.cbProductType = new System.Windows.Forms.ComboBox();
            this.lbProductType = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // rbPremium
            // 
            this.rbPremium.AutoSize = true;
            this.rbPremium.Location = new System.Drawing.Point(29, 137);
            this.rbPremium.Name = "rbPremium";
            this.rbPremium.Size = new System.Drawing.Size(145, 17);
            this.rbPremium.TabIndex = 3;
            this.rbPremium.TabStop = true;
            this.rbPremium.Text = "Search by yearly premium";
            this.rbPremium.UseVisualStyleBackColor = true;
            this.rbPremium.Click += new System.EventHandler(this.rbPremium_Click);
            // 
            // rbProductType
            // 
            this.rbProductType.AutoSize = true;
            this.rbProductType.Location = new System.Drawing.Point(29, 89);
            this.rbProductType.Name = "rbProductType";
            this.rbProductType.Size = new System.Drawing.Size(135, 17);
            this.rbProductType.TabIndex = 2;
            this.rbProductType.TabStop = true;
            this.rbProductType.Text = "Search by product type";
            this.rbProductType.UseVisualStyleBackColor = true;
            this.rbProductType.Click += new System.EventHandler(this.rbProductType_Click);
            // 
            // rbAll
            // 
            this.rbAll.AutoSize = true;
            this.rbAll.Location = new System.Drawing.Point(29, 41);
            this.rbAll.Name = "rbAll";
            this.rbAll.Size = new System.Drawing.Size(79, 17);
            this.rbAll.TabIndex = 0;
            this.rbAll.TabStop = true;
            this.rbAll.Text = "List all rows";
            this.rbAll.UseVisualStyleBackColor = true;
            this.rbAll.Click += new System.EventHandler(this.rbAll_Click);
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(388, 137);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(75, 23);
            this.btnSearch.TabIndex = 7;
            this.btnSearch.Text = "&Search";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // txtSearch
            // 
            this.txtSearch.Location = new System.Drawing.Point(260, 39);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(203, 20);
            this.txtSearch.TabIndex = 4;
            this.txtSearch.Visible = false;
            // 
            // cbProductType
            // 
            this.cbProductType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbProductType.FormattingEnabled = true;
            this.cbProductType.Location = new System.Drawing.Point(260, 87);
            this.cbProductType.Name = "cbProductType";
            this.cbProductType.Size = new System.Drawing.Size(203, 21);
            this.cbProductType.TabIndex = 6;
            this.cbProductType.Visible = false;
            // 
            // lbProductType
            // 
            this.lbProductType.FormattingEnabled = true;
            this.lbProductType.Location = new System.Drawing.Point(480, 89);
            this.lbProductType.Name = "lbProductType";
            this.lbProductType.Size = new System.Drawing.Size(20, 17);
            this.lbProductType.TabIndex = 9;
            this.lbProductType.Visible = false;
            // 
            // frmSearchProducts
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(528, 187);
            this.Controls.Add(this.lbProductType);
            this.Controls.Add(this.cbProductType);
            this.Controls.Add(this.rbPremium);
            this.Controls.Add(this.rbProductType);
            this.Controls.Add(this.rbAll);
            this.Controls.Add(this.btnSearch);
            this.Controls.Add(this.txtSearch);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmSearchProducts";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Search Products";
            this.Load += new System.EventHandler(this.frmSearchProducts_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.RadioButton rbPremium;
        private System.Windows.Forms.RadioButton rbProductType;
        private System.Windows.Forms.RadioButton rbAll;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.ComboBox cbProductType;
        private System.Windows.Forms.ListBox lbProductType;
    }
}