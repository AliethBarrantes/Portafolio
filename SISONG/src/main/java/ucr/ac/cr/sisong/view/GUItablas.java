/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package ucr.ac.cr.sisong.view;

import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import ucr.ac.cr.sisong.controller.ControllerTablas;
import ucr.ac.cr.sisong.model.Song;

/**
 *
 * @author Adm
 */
public class GUItablas extends javax.swing.JFrame {


    public GUItablas(String[][] listaCanciones, ControllerTablas controller) {
        initComponents();
        setTblCanciones(listaCanciones);
        setVisible(true);
        
        this.tblCanciones.getSelectionModel().addListSelectionListener(controller);
        this.tblDetalles.addMouseListener(controller);
    }

    public void setTblCanciones(String [][] data)
    {
        this.tblCanciones.setModel(new DefaultTableModel (data, Song.TITLE_SONG));
    }
    
    public void setTblDetalles(String [][] data)
    {
        this.tblDetalles.setModel(new DefaultTableModel (data, Song.TITLE_SONG)
        {
            public boolean isCellEditable(int row, int column)
            {
                return false;
            }
        });
                
                
                
                
                
//        {
//            public boolean isCellEditable(int row, int column)
//            {
//                return false;
//            }
//        });
                
                
                
//        {
//            public boolean isCellEditable(int row, int column) {
//                return false; // No permitir edici�n de celdas
//            }
//        });
    }
    
    
    public int getSelectedTblCanciones()
    {
        
        if (tblCanciones.getSelectedRow() != -1)
        {
            // Obtener el valor de la celda como String
            String idString = (String) tblCanciones.getValueAt(tblCanciones.getSelectedRow(), 0);
            // Convertir el String a Integer
            int id = Integer.parseInt(idString);
            System.out.println("ID: " + id);
            
            return id;   
        }
        else
        {
            return -1;
        }
         
    }
    
    public int getSelectedTblDetalles()
    {
        System.out.println("FILA SELECCIONADA: "+tblDetalles.getSelectedRow() );
        if (tblDetalles.getSelectedRow() != -1)
        {
            // Obtener el valor de la celda como String
            String idString = (String) tblDetalles.getValueAt(tblDetalles.getSelectedRow(), 0);
            // Convertir el String a Integer
            int id = Integer.parseInt(idString);
            System.out.println("ID: " + id);
            return id;   
        }
        else
        {
            return -1;
        }
         
    }
    
    
    public JTable getTblCanciones() {
        
        return tblCanciones;
        
    }

    public JTable getTblDetalles() {
        return tblDetalles;
    }
    
    
    
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane2 = new javax.swing.JScrollPane();
        tblReport1 = new javax.swing.JTable();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblDetalles = new javax.swing.JTable();
        jScrollPane3 = new javax.swing.JScrollPane();
        tblCanciones = new javax.swing.JTable();
        btnClose = new javax.swing.JButton();

        tblReport1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane2.setViewportView(tblReport1);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tblDetalles.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(tblDetalles);

        tblCanciones.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "name", "Title 2", "Title 3", "Title 4"
            }
        ));
        tblCanciones.setCellSelectionEnabled(true);
        jScrollPane3.setViewportView(tblCanciones);
        tblCanciones.getColumnModel().getSelectionModel().setSelectionMode(javax.swing.ListSelectionModel.SINGLE_INTERVAL_SELECTION);

        btnClose.setText("Close");
        btnClose.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCloseActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 529, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 529, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(20, 20, 20)
                                .addComponent(btnClose)))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addComponent(btnClose)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 26, Short.MAX_VALUE)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 176, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 176, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCloseActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCloseActionPerformed
        this.dispose();
    }//GEN-LAST:event_btnCloseActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnClose;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTable tblCanciones;
    private javax.swing.JTable tblDetalles;
    private javax.swing.JTable tblReport1;
    // End of variables declaration//GEN-END:variables






}
