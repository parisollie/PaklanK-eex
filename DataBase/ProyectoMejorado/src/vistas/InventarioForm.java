//Se usa y listo
package vistas;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import modelo.INDAO;
import modelo.Inv;
import modelo.INVENTARIODAO;

import modelo.Producto;
import modelo.ProductoDAO;


public class InventarioForm extends javax.swing.JInternalFrame {

    INDAO indao = new INDAO();
    INVENTARIODAO inventarioDAO = new INVENTARIODAO();
    ProductoDAO proDao = new ProductoDAO();
    
    Inv inven = new Inv();
    Producto producto = new Producto();
    
    DefaultTableModel modelo = new DefaultTableModel();

    double pre;
    double preven;
    int r;

    public InventarioForm() {
        initComponents();
        listar();
        fecha();

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
        List<Inv> lista = inventarioDAO.listar();
        modelo = (DefaultTableModel) TablaDetalle.getModel();
        Object[] ob = new Object[7];
        for (int i = 0; i < lista.size(); i++) {

            ob[0] = lista.get(i).getIdc();
            ob[1] = lista.get(i).getCod();
            ob[2] = lista.get(i).getIp();
            ob[3] = lista.get(i).getPc();
            ob[4] = lista.get(i).getPl();
            ob[5] = lista.get(i).getFecha();
            ob[6] = lista.get(i).getStock();
            modelo.addRow(ob);
        }
        TablaDetalle.setModel(modelo);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel6 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        IDPROV = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        txtIdprov = new javax.swing.JTextField();
        txtPC = new javax.swing.JTextField();
        btnEliminar = new javax.swing.JButton();
        btnbuscar = new javax.swing.JButton();
        jLabel13 = new javax.swing.JLabel();
        txtPV = new javax.swing.JTextField();
        txtStock = new javax.swing.JTextField();
        jLabel14 = new javax.swing.JLabel();
        txtCB = new javax.swing.JTextField();
        txtprov = new javax.swing.JTextField();
        txtFecha = new javax.swing.JTextField();
        jLabel15 = new javax.swing.JLabel();
        GENERAR = new javax.swing.JButton();
        NUEVO = new javax.swing.JButton();
        GENERAR2 = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        TablaDetalle = new javax.swing.JTable();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("INVENTARIO");

        jPanel6.setBackground(new java.awt.Color(255, 204, 204));
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
                        .addGap(215, 215, 215)
                        .addComponent(jLabel3)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
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

        IDPROV.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        IDPROV.setText("IDPRODUCTO:");

        jLabel6.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel6.setText("CODBARRAS:");

        jLabel11.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel11.setText("PRECOM:");

        txtIdprov.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtIdprov.setForeground(new java.awt.Color(51, 51, 255));
        txtIdprov.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtIdprovActionPerformed(evt);
            }
        });
        txtIdprov.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtIdprovKeyTyped(evt);
            }
        });

        txtPC.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtPC.setForeground(new java.awt.Color(51, 51, 255));
        txtPC.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtPCActionPerformed(evt);
            }
        });
        txtPC.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtPCKeyTyped(evt);
            }
        });

        btnEliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/cancelar.png"))); // NOI18N
        btnEliminar.setText("Eliminar");
        btnEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEliminarActionPerformed(evt);
            }
        });

        btnbuscar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/buscar.png"))); // NOI18N
        btnbuscar.setText("Buscar");
        btnbuscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnbuscarActionPerformed(evt);
            }
        });

        jLabel13.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel13.setText("PREVEN:");

        txtPV.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtPV.setForeground(new java.awt.Color(51, 51, 255));
        txtPV.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtPVActionPerformed(evt);
            }
        });
        txtPV.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtPVKeyTyped(evt);
            }
        });

        txtStock.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtStock.setForeground(new java.awt.Color(51, 51, 255));
        txtStock.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtStockActionPerformed(evt);
            }
        });
        txtStock.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtStockKeyTyped(evt);
            }
        });

        jLabel14.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel14.setText("STOCK:");

        txtCB.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtCB.setForeground(new java.awt.Color(51, 51, 255));
        txtCB.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtCBActionPerformed(evt);
            }
        });
        txtCB.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtCBKeyTyped(evt);
            }
        });

        txtprov.setEditable(false);
        txtprov.setBackground(new java.awt.Color(204, 204, 255));
        txtprov.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtprov.setForeground(new java.awt.Color(153, 0, 153));
        txtprov.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtprovActionPerformed(evt);
            }
        });

        txtFecha.setEditable(false);
        txtFecha.setBackground(new java.awt.Color(255, 204, 204));
        txtFecha.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        txtFecha.setForeground(new java.awt.Color(153, 0, 153));
        txtFecha.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtFechaActionPerformed(evt);
            }
        });

        jLabel15.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel15.setText("FECHA:");

        GENERAR.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/vendedor.png"))); // NOI18N
        GENERAR.setText("AGREGAR");
        GENERAR.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                GENERARActionPerformed(evt);
            }
        });

        NUEVO.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/add.png"))); // NOI18N
        NUEVO.setText("NUEVO");
        NUEVO.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                NUEVOActionPerformed(evt);
            }
        });

        GENERAR2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Img/enter.png"))); // NOI18N
        GENERAR2.setText("ACTUALIZAR");
        GENERAR2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                GENERAR2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(23, 23, 23)
                        .addComponent(btnEliminar)
                        .addGap(63, 63, 63)
                        .addComponent(NUEVO, javax.swing.GroupLayout.PREFERRED_SIZE, 117, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 63, Short.MAX_VALUE)
                        .addComponent(GENERAR, javax.swing.GroupLayout.PREFERRED_SIZE, 117, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel6)
                            .addComponent(IDPROV)
                            .addComponent(jLabel11)
                            .addComponent(jLabel13))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(txtIdprov, javax.swing.GroupLayout.PREFERRED_SIZE, 112, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(btnbuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 101, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addGap(0, 0, Short.MAX_VALUE)
                                .addComponent(jLabel15))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                    .addComponent(txtPV, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 112, Short.MAX_VALUE)
                                    .addComponent(txtCB, javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(txtPC, javax.swing.GroupLayout.Alignment.LEADING))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel14)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(txtStock, javax.swing.GroupLayout.DEFAULT_SIZE, 134, Short.MAX_VALUE)
                            .addComponent(txtprov)
                            .addComponent(txtFecha))))
                .addGap(76, 76, 76)
                .addComponent(GENERAR2)
                .addGap(16, 16, 16))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtprov, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(IDPROV)
                                .addComponent(txtIdprov, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(btnbuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel6)
                            .addComponent(txtCB, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(7, 7, 7))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel14)
                            .addComponent(txtStock, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(44, 44, 44)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txtFecha, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel15)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(26, 26, 26)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel11)
                            .addComponent(txtPC, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel13)
                    .addComponent(txtPV, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 18, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(btnEliminar, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(NUEVO, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(GENERAR, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(GENERAR2, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        jPanel2.setBackground(new java.awt.Color(255, 153, 153));
        jPanel2.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        TablaDetalle.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "IDIN", "CB", "IDPROD", "PRECOM", "PREVEN", "FECHA", "STOCK"
            }
        ));
        TablaDetalle.setRowHeight(30);
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
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 696, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 123, Short.MAX_VALUE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel6, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 699, Short.MAX_VALUE)))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtPCActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtPCActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtPCActionPerformed

    private void txtIdprovActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtIdprovActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtIdprovActionPerformed

    private void btnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEliminarActionPerformed

        int fila = TablaDetalle.getSelectedRow();
        if (fila == -1) {
            JOptionPane.showMessageDialog(this, "Debe seleccionar una fila");
        } else {
            int id = Integer.parseInt(TablaDetalle.getValueAt(fila, 0).toString());
            indao.eliminar(id);
            JOptionPane.showMessageDialog(this, "Se ha eliminado el registro!");
        }
        
        nuevo();
        listar();

    }//GEN-LAST:event_btnEliminarActionPerformed

    private void btnbuscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnbuscarActionPerformed
        buscarProducto();
    }//GEN-LAST:event_btnbuscarActionPerformed

    private void txtPVActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtPVActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtPVActionPerformed

    private void txtStockActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtStockActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtStockActionPerformed

    private void txtCBActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtCBActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtCBActionPerformed

    private void txtprovActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtprovActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtprovActionPerformed

    private void txtFechaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtFechaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtFechaActionPerformed

    private void GENERARActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_GENERARActionPerformed
        // TODO add your handling code here:
        add();
        JOptionPane.showMessageDialog(this, "Se realizo con exito!");
        nuevo();
        listar();

    }//GEN-LAST:event_GENERARActionPerformed

    private void TablaDetalleMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_TablaDetalleMouseClicked
        //al seleccionar una fila se vera en las cajas de texto la informacion
        // TODO add your handling code here:
        int fila = TablaDetalle.getSelectedRow();
        if (fila == -1) {
            JOptionPane.showMessageDialog(this, "Debe seleccionar una fila");
        } else {

            String cb = TablaDetalle.getValueAt(fila, 1).toString();
            String idprov = TablaDetalle.getValueAt(fila, 2).toString();
            String precom = TablaDetalle.getValueAt(fila, 3).toString();
            String preven = TablaDetalle.getValueAt(fila, 4).toString();
            String fecha = TablaDetalle.getValueAt(fila, 5).toString();
            String stock = TablaDetalle.getValueAt(fila, 6).toString();

            txtCB.setText(cb);
            txtIdprov.setText(idprov);
            txtPC.setText(precom);
            txtPV.setText(preven);
            txtFecha.setText(fecha);
            txtStock.setText(stock);

        }
    }//GEN-LAST:event_TablaDetalleMouseClicked

    private void TablaDetalleKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TablaDetalleKeyPressed
        // TODO add your handling code here:
    }//GEN-LAST:event_TablaDetalleKeyPressed

    private void NUEVOActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_NUEVOActionPerformed
        // TODO add your handling code here:
        nuevo();
        listar();
    }//GEN-LAST:event_NUEVOActionPerformed

    private void GENERAR2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_GENERAR2ActionPerformed
        // TODO add your handling code here:
        actualizar();
        JOptionPane.showMessageDialog(this, "Se actualizo con exito!");
        limpiarTabla();
        nuevo();
        listar();

    }//GEN-LAST:event_GENERAR2ActionPerformed

    private void txtIdprovKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtIdprovKeyTyped
        // TODO add your handling code here:
        //Validar que se metan numeros
        char c = evt.getKeyChar();
        if (c < '0' || c > '9') {
            evt.consume();
        }
    }//GEN-LAST:event_txtIdprovKeyTyped

    private void txtCBKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtCBKeyTyped
        // TODO add your handling code here:
        //Validar que se metan numeros
        char c = evt.getKeyChar();
        if (c < '0' || c > '9') {
            evt.consume();
        }
    }//GEN-LAST:event_txtCBKeyTyped

    private void txtPCKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtPCKeyTyped
        // TODO add your handling code here:
        //Validar que se metan numeros
        char c = evt.getKeyChar();
        if (c < '0' || c > '9') {
            evt.consume();
        }
    }//GEN-LAST:event_txtPCKeyTyped

    private void txtPVKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtPVKeyTyped
        // TODO add your handling code here:
        //Validar que se metan numeros
        char c = evt.getKeyChar();
        if (c < '0' || c > '9') {
            evt.consume();
        }
    }//GEN-LAST:event_txtPVKeyTyped

    private void txtStockKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtStockKeyTyped
        // TODO add your handling code here:
        //Validar que se metan numeros
        char c = evt.getKeyChar();
        if (c < '0' || c > '9') {
            evt.consume();
        }
    }//GEN-LAST:event_txtStockKeyTyped
    //Se usa
    void buscarProducto() {
        int id = Integer.parseInt(txtIdprov.getText());
        if (txtIdprov.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "Debe ingresar el idprovedor");
        } else {
            producto = proDao.listarID(id);
            if (producto.getId() != 0) {//p=proveedor 
                txtprov.setText(producto.getMarca());

            } else {
                JOptionPane.showMessageDialog(this, "Producto no registrado");
                txtIdprov.requestFocus();
            }
        }
    }

    //Se usa
    //Metodo agregar 2
    void add() {

        int codBAR = Integer.parseInt(txtCB.getText());
        int idprod = Integer.parseInt(txtIdprov.getText());
        pre = Double.parseDouble(txtPC.getText());
        preven = Double.parseDouble(txtPV.getText());
        String fecha = txtFecha.getText();
        int stock = Integer.parseInt(txtStock.getText());

        Object[] ob = new Object[6];
        ob[0] = codBAR;
        ob[1] = idprod;
        ob[2] = pre;
        ob[3] = preven;
        ob[4] = fecha;
        ob[5] = stock;

        inventarioDAO.add(ob);

    }

    //Se usa 
    void actualizar() {
        int fila = TablaDetalle.getSelectedRow();
        if (fila == -1) {
            JOptionPane.showMessageDialog(this, "Debe selecionar una fila");
        } else {
            //Solo elegimos el id,porque es el unico que no puede cambiar,por
            //eso el id tiene otra forma al de los demas int
            int id = Integer.parseInt(modelo.getValueAt(fila, 0).toString());

            int codBAR = Integer.parseInt(txtCB.getText());
            int idprod = Integer.parseInt(txtIdprov.getText());
            double precompra = Double.parseDouble(txtPC.getText());
            double preventa = Double.parseDouble(txtPV.getText());
            String fecha = txtFecha.getText();
            int stock = Integer.parseInt(txtStock.getText());

            inven.setCod(codBAR);
            inven.setIp(idprod);
            inven.setPc(precompra);
            inven.setPl(preventa);
            inven.setFecha(fecha);
            inven.setStock(stock);
            inven.setIdc(id);

            r = indao.actualizar(inven);

            if (r == 1) {
                JOptionPane.showMessageDialog(this, "Producto actualizado con exito!");
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
        txtIdprov.setText("");
        txtprov.setText("");
        txtPC.setText("");
        txtPV.setText("");
        txtCB.setText("");
        txtStock.setText("");

        txtIdprov.requestFocus();
    }

    //Se usa
    void limpiarTabla() {
        for (int i = 0; i < modelo.getRowCount(); i++) {
            modelo.removeRow(i);
            i = i - 1;
        }
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton GENERAR;
    private javax.swing.JButton GENERAR2;
    private javax.swing.JLabel IDPROV;
    private javax.swing.JButton NUEVO;
    private javax.swing.JTable TablaDetalle;
    private javax.swing.JButton btnEliminar;
    private javax.swing.JButton btnbuscar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField txtCB;
    private javax.swing.JTextField txtFecha;
    private javax.swing.JTextField txtIdprov;
    private javax.swing.JTextField txtPC;
    private javax.swing.JTextField txtPV;
    private javax.swing.JTextField txtStock;
    private javax.swing.JTextField txtprov;
    // End of variables declaration//GEN-END:variables
}
