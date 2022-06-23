//Se usa y listo
package vistas;


import java.util.Calendar;
import java.util.GregorianCalendar;
//PDF

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
///
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

import modelo.Cliente;
import modelo.VENTASDAO;
import modelo.ClienteDAO;
import modelo.LISTASDAO;


import modelo.INDAO;
import modelo.Vendedor;
import modelo.Ventas;

import modelo.Conexion;


public class VentasForm extends javax.swing.JInternalFrame {

    Cliente cl = new Cliente();
    ClienteDAO cldDAO = new ClienteDAO();
    Vendedor ven = new Vendedor();
    VENTASDAO ventasDao = new VENTASDAO();
    Ventas ventas = new Ventas();
    INDAO indao = new INDAO();
    LISTASDAO listasDao = new LISTASDAO();

    DefaultTableModel modelo = new DefaultTableModel();

    int r;

    public VentasForm() {
        initComponents();
        fecha();
        listar();
    }

    public void fecha() {

        Calendar calendar = new GregorianCalendar();

        int año, mes, dia;

        año = calendar.get(Calendar.YEAR);
        mes = calendar.get(Calendar.MONTH) + 1;
        dia = calendar.get(Calendar.DATE);

        if (mes < 10) {
            txtFecha.setText(año + "/0" + mes + "/" + dia);
        }
        if (dia < 10) {
            txtFecha.setText(año + "/" + mes + "/0" + dia);
        }
        if (dia > 10 && mes > 10) {
            txtFecha.setText(año + "/" + mes + "/" + dia);
        } else if (dia < 10 && mes < 10) {
            txtFecha.setText(año + "/0" + mes + "/0" + dia);
        }
    }

    void listar() {
        List<Ventas> lista = ventasDao.listar();
        modelo = (DefaultTableModel) TablaDetalle.getModel();
        Object[] ob = new Object[4];
        for (int i = 0; i < lista.size(); i++) {

            ob[0] = lista.get(i).getVn();
            ob[1] = lista.get(i).getCl();
            ob[2] = lista.get(i).getVendedor();
            ob[3] = lista.get(i).getFeha();
            modelo.addRow(ob);
        }
        TablaDetalle.setModel(modelo);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane2 = new javax.swing.JScrollPane();
        jEditorPane1 = new javax.swing.JEditorPane();
        jPanel6 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        txtIdC = new javax.swing.JTextField();
        txtIdv = new javax.swing.JTextField();
        txtVendedor = new javax.swing.JTextField();
        txtFecha = new javax.swing.JTextField();
        btnbuscar = new javax.swing.JButton();
        btnACTUALIZAR = new javax.swing.JButton();
        btnEliminar = new javax.swing.JButton();
        btnbuscarc = new javax.swing.JButton();
        txtCliente = new javax.swing.JTextField();
        btnADD = new javax.swing.JButton();
        btnNuevo = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        TablaDetalle = new javax.swing.JTable();

        jScrollPane2.setViewportView(jEditorPane1);

        setBackground(new java.awt.Color(0, 255, 204));
        setClosable(true);
        setForeground(new java.awt.Color(204, 102, 255));
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("VENTAS");

        jPanel6.setBackground(new java.awt.Color(255, 153, 153));
        jPanel6.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/zorro.jpg"))); // NOI18N

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel2.setText("www.paklan.com");

        jLabel3.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel3.setText("Paklan k'eex");

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addGap(198, 198, 198)
                        .addComponent(jLabel2))
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addGap(216, 216, 216)
                        .addComponent(jLabel3)))
                .addContainerGap(268, Short.MAX_VALUE))
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jLabel2)
                        .addGap(41, 41, 41))
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );

        jPanel1.setBackground(new java.awt.Color(255, 102, 102));
        jPanel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jLabel5.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel5.setText("IDCLIENTE:");

        jLabel6.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel6.setText("IDVENDEDOR:");

        jLabel7.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel7.setText("VENDEDOR:");

        jLabel10.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel10.setText("CLIENTE:");

        jLabel11.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel11.setText("FECHA:");

        txtIdC.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtIdC.setForeground(new java.awt.Color(51, 51, 255));
        txtIdC.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtIdCActionPerformed(evt);
            }
        });
        txtIdC.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtIdCKeyTyped(evt);
            }
        });

        txtIdv.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtIdv.setForeground(new java.awt.Color(51, 51, 255));
        txtIdv.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtIdvActionPerformed(evt);
            }
        });
        txtIdv.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtIdvKeyTyped(evt);
            }
        });

        txtVendedor.setEditable(false);
        txtVendedor.setBackground(new java.awt.Color(204, 204, 255));
        txtVendedor.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtVendedor.setForeground(new java.awt.Color(153, 0, 153));
        txtVendedor.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtVendedorActionPerformed(evt);
            }
        });

        txtFecha.setEditable(false);
        txtFecha.setBackground(new java.awt.Color(204, 204, 255));
        txtFecha.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtFecha.setForeground(new java.awt.Color(153, 0, 153));

        btnbuscar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/buscar.png"))); // NOI18N
        btnbuscar.setText("Buscar");
        btnbuscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnbuscarActionPerformed(evt);
            }
        });

        btnACTUALIZAR.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnACTUALIZAR.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/add.png"))); // NOI18N
        btnACTUALIZAR.setText("ACTUALZIAR");
        btnACTUALIZAR.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnACTUALIZARActionPerformed(evt);
            }
        });

        btnEliminar.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnEliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/cancelar.png"))); // NOI18N
        btnEliminar.setText("ELIMINAR");
        btnEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEliminarActionPerformed(evt);
            }
        });

        btnbuscarc.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/buscar.png"))); // NOI18N
        btnbuscarc.setText("Buscar");
        btnbuscarc.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnbuscarcActionPerformed(evt);
            }
        });

        txtCliente.setEditable(false);
        txtCliente.setBackground(new java.awt.Color(204, 204, 255));
        txtCliente.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtCliente.setForeground(new java.awt.Color(153, 0, 153));

        btnADD.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/ticket.png"))); // NOI18N
        btnADD.setText("GENERAR");
        btnADD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnADDActionPerformed(evt);
            }
        });

        btnNuevo.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnNuevo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/add.png"))); // NOI18N
        btnNuevo.setText("NUEVO");
        btnNuevo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNuevoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addComponent(jLabel6)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(txtIdv, javax.swing.GroupLayout.PREFERRED_SIZE, 134, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addComponent(jLabel5)
                                        .addGap(31, 31, 31)
                                        .addComponent(txtIdC, javax.swing.GroupLayout.PREFERRED_SIZE, 134, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addGap(29, 29, 29)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(btnbuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 101, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(btnbuscarc, javax.swing.GroupLayout.PREFERRED_SIZE, 101, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel11)
                                .addGap(55, 55, 55)
                                .addComponent(txtFecha, javax.swing.GroupLayout.PREFERRED_SIZE, 119, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(32, 32, 32)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel10)
                                .addGap(18, 18, 18)
                                .addComponent(txtCliente, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel7)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtVendedor))))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(btnADD)
                        .addGap(64, 64, 64)
                        .addComponent(btnACTUALIZAR)
                        .addGap(69, 69, 69)
                        .addComponent(btnNuevo, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(39, 39, 39)
                        .addComponent(btnEliminar, javax.swing.GroupLayout.PREFERRED_SIZE, 132, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(jLabel10)
                    .addComponent(txtIdC, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnbuscarc, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtCliente, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(txtIdv, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnbuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7)
                    .addComponent(txtVendedor, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(28, 28, 28)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel11)
                    .addComponent(txtFecha, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(31, 31, 31)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnACTUALIZAR, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnEliminar, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnADD, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnNuevo, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(19, Short.MAX_VALUE))
        );

        jPanel2.setBackground(new java.awt.Color(255, 153, 153));
        jPanel2.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        TablaDetalle.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "IDVENTA", "IDCL", "IDVENDEDOR", "FECHA"
            }
        ));
        TablaDetalle.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                TablaDetalleMouseClicked(evt);
            }
        });
        TablaDetalle.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TablaDetalleKeyPressed(evt);
            }
        });
        jScrollPane1.setViewportView(TablaDetalle);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addComponent(jScrollPane1)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 141, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(129, 129, 129))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jPanel2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 208, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtIdvActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtIdvActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtIdvActionPerformed

    private void btnACTUALIZARActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnACTUALIZARActionPerformed
        actualizar();
        limpiarTabla();
        nuevo();
        listar();
    }//GEN-LAST:event_btnACTUALIZARActionPerformed

    private void btnADDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnADDActionPerformed

        add();
        JOptionPane.showMessageDialog(this, "Se realizo con exito!");
        limpiarTabla();
        nuevo();
        listar();
        fecha();

    }//GEN-LAST:event_btnADDActionPerformed

    private void btnbuscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnbuscarActionPerformed
        buscarVendedor();
    }//GEN-LAST:event_btnbuscarActionPerformed

    private void txtIdCActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtIdCActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtIdCActionPerformed

    private void TablaDetalleMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_TablaDetalleMouseClicked
        // TODO add your handling code here:
        int fila = TablaDetalle.getSelectedRow();
        if (fila == -1) {
            JOptionPane.showMessageDialog(this, "Debe Seleccionar una Fila");
        } else {

            String idcl = TablaDetalle.getValueAt(fila, 1).toString();
            String idvend = TablaDetalle.getValueAt(fila, 2).toString();
            String Fecha = TablaDetalle.getValueAt(fila, 3).toString();

            txtIdC.setText(idcl);
            txtIdv.setText(idvend);
            txtFecha.setText(Fecha);

        }
    }//GEN-LAST:event_TablaDetalleMouseClicked

    private void TablaDetalleKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TablaDetalleKeyPressed
        // TODO add your handling code here:
    }//GEN-LAST:event_TablaDetalleKeyPressed

    private void btnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEliminarActionPerformed

        int fila = TablaDetalle.getSelectedRow();
        if (fila == -1) {
            JOptionPane.showMessageDialog(this, "Debe seleccionar una fila");
        } else {
            int id = Integer.parseInt(TablaDetalle.getValueAt(fila, 0).toString());
            indao.eliminarVen(id);
            JOptionPane.showMessageDialog(this, "Se ha eliminado el registro!");
        }
        nuevo();
        listar();
    }//GEN-LAST:event_btnEliminarActionPerformed

    private void btnbuscarcActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnbuscarcActionPerformed
        buscarCliente();
    }//GEN-LAST:event_btnbuscarcActionPerformed

    private void txtVendedorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtVendedorActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtVendedorActionPerformed

    private void btnNuevoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNuevoActionPerformed
        // TODO add your handling code here:
        nuevo();
        listar();
        fecha();
    }//GEN-LAST:event_btnNuevoActionPerformed

    private void txtIdCKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtIdCKeyTyped
        // TODO add your handling code here:
        //Validar que se metan numeros
        char c = evt.getKeyChar();
        if (c < '0' || c > '9') {
            evt.consume();
        }
    }//GEN-LAST:event_txtIdCKeyTyped

    private void txtIdvKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtIdvKeyTyped
        // TODO add your handling code here:
        //Validar que se metan numeros
        char c = evt.getKeyChar();
        if (c < '0' || c > '9') {
            evt.consume();
        }
    }//GEN-LAST:event_txtIdvKeyTyped
    //Se usa
    void add() {

        int idcl = Integer.parseInt(txtIdC.getText());
        int idv = Integer.parseInt(txtIdv.getText());
        String fecha = txtFecha.getText();

        //OrdenarBien
        Object[] ob = new Object[3];

        ob[0] = idcl;
        ob[1] = idv;
        ob[2] = fecha;

        ventasDao.add(ob);

        //PDF
        Connection con;
        Conexion cn = new Conexion();
        PreparedStatement ps;
        ResultSet rs = null;
        String sql = "select idventa as idventa from venta order by idventa desc limit 1";
        try {
             //Adaptar para la máquina en que se use
            String ruta = "C:\\Users\\hasti\\Desktop\\ESCOMCU\\Todo\\ProyectoBasesMejorado";
            String rutaImagen = "C:\\Users\\hasti\\Desktop\\ESCOMCU\\Todo\\ProyectoMejorado\\src\\Img\\EncabezadoFactura2.jpg";
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.first();
            int idventa = rs.getInt(1);
            String nombreArchivo = "venta " + idventa + ".pdf"; //Adaptar para que el nombre de archivo cambie en cada venta
            String contenido1 = "\n Venta: " + idventa + '\n' + "\n Id-cliente: " + txtIdC.getText() + '\n' + "\n Id-vendedor: " + txtIdv.getText() + '\n' + "\n Fecha: " + txtFecha.getText();
            FileWriter pdf = new FileWriter(ruta + nombreArchivo);
            pdf.close();
            FileOutputStream archivo = new FileOutputStream(ruta + nombreArchivo);
            Document documento = new Document();
            PdfWriter.getInstance(documento, archivo);
            documento.open();
            Image imagen = Image.getInstance(rutaImagen);
            imagen.scaleAbsolute(450, 70);
            imagen.setAlignment(Element.ALIGN_LEFT);
            documento.add(imagen);
            documento.add(new Paragraph(contenido1));
            documento.close();
            JOptionPane.showMessageDialog(null, "Se ha generado el PDF!");
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    //Se usa
    void actualizar() {
        int fila = TablaDetalle.getSelectedRow();
        if (fila == -1) {
            JOptionPane.showMessageDialog(this, "Debe selecionar una Fila");
        } else {
            //Solo elegimos el id,porque es el unico que no puede cambiar,por
            //eso el id tiene otra forma al de los demas int
            int idV = Integer.parseInt(modelo.getValueAt(fila, 0).toString());

            int idcli = Integer.parseInt(txtIdC.getText());
            int idvend = Integer.parseInt(txtIdv.getText());
            String fecha = txtFecha.getText();

            ventas.setCl(idcli);
            ventas.setVendedor(idvend);
            ventas.setFeha(fecha);
            ventas.setVn(idV);

            r = indao.actualizarventas(ventas);

            if (r == 1) {
                JOptionPane.showMessageDialog(this, "Se actualizo con exito!");
            } else {
                JOptionPane.showMessageDialog(this, "Error");
            }
            limpiarTabla();
            listar();
            nuevo();
        }

    }
    //Se usa
    void nuevo() { // Para limpiar las cajas de texto
        limpiarTabla();// Limpiamos la tabla
        txtIdC.setText("");
        txtIdv.setText("");
        txtCliente.setText("");
        txtVendedor.setText("");
        txtFecha.setText("");
        txtIdC.requestFocus();

    }
    //Se usa
    void buscarCliente() {
        int id = Integer.parseInt(txtIdC.getText());
        if (txtIdC.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "Debe ingresar el idcliente");
        } else {
            cl = cldDAO.listarIDs(id);
            if (cl.getId() != 0) { 
                txtCliente.setText(cl.getNombres());

            } else {
                JOptionPane.showMessageDialog(this, "Cliente no registrado");
                txtIdC.requestFocus();
            }
        }
    }
    //Se usa
    void buscarVendedor() {
        int id = Integer.parseInt(txtIdv.getText());
        if (txtIdv.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "Debe ingresar el idvendedor");
        } else {
            ven = listasDao.listarIDs(id);
            if (ven.getId() != 0) { 
                txtVendedor.setText(ven.getNom());

            } else {
                JOptionPane.showMessageDialog(this, "Vendedor no registrado");
                txtIdv.requestFocus();
            }
        }
    }
    
    ////////////////////////////////////////////////////////////////////////

    void limpiarTabla() {
        for (int i = 0; i < modelo.getRowCount(); i++) {
            modelo.removeRow(i);
            i = i - 1;
        }
    }

    /*Medoto´para Agregar en tabla
    void agregar() {
        modelo = (DefaultTableModel) TablaDetalle.getModel();
        item = item + 1;

        int idcl = Integer.parseInt(txtIdC.getText());
        int idpro = Integer.parseInt(txtIdv.getText());

        ArrayList lista = new ArrayList();
        {
            lista.add(item);
            lista.add(idcl);
            lista.add(idpro);

            Object[] ob = new Object[3];
            ob[0] = lista.get(0);
            ob[1] = lista.get(1);
            ob[2] = lista.get(2);

            modelo.addRow(ob);

            TablaDetalle.setModel(modelo);

        }

    }*/
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTable TablaDetalle;
    private javax.swing.JButton btnACTUALIZAR;
    private javax.swing.JButton btnADD;
    private javax.swing.JButton btnEliminar;
    private javax.swing.JButton btnNuevo;
    private javax.swing.JButton btnbuscar;
    private javax.swing.JButton btnbuscarc;
    private javax.swing.JEditorPane jEditorPane1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextField txtCliente;
    private javax.swing.JTextField txtFecha;
    private javax.swing.JTextField txtIdC;
    private javax.swing.JTextField txtIdv;
    private javax.swing.JTextField txtVendedor;
    // End of variables declaration//GEN-END:variables
}
