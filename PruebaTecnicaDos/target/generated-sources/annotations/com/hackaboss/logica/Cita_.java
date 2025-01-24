package com.hackaboss.logica;

import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.Tramite;
import java.time.LocalDate;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2025-01-23T23:12:48")
@StaticMetamodel(Cita.class)
public class Cita_ { 

    public static volatile SingularAttribute<Cita, String> descripcion;
    public static volatile SingularAttribute<Cita, LocalDate> fecha;
    public static volatile SingularAttribute<Cita, Boolean> estado;
    public static volatile SingularAttribute<Cita, Tramite> tramite;
    public static volatile SingularAttribute<Cita, String> hora;
    public static volatile SingularAttribute<Cita, Long> id;
    public static volatile SingularAttribute<Cita, Ciudadano> ciudadano;

}