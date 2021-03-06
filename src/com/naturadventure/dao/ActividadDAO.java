package com.naturadventure.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.HorasInicio;
import com.naturadventure.domain.NivelActividad;


@Repository
public class ActividadDAO {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class ActividadMapper implements RowMapper<Actividad> { 
		
	    public Actividad mapRow(ResultSet rs, int rowNum) throws SQLException { 
	        Actividad actividad = new Actividad();
	        actividad.setIdActividad(rs.getInt("idActividad"));
	        actividad.setNombre(rs.getString("nombre"));
	        actividad.setTipo(rs.getString("tipo"));
	        actividad.setDuracionHoras(rs.getInt("duracionHoras"));
	        actividad.setDescripcion(rs.getString("descripcion"));
	        actividad.setMinParticipantes(rs.getInt("minParticipantes"));
	        actividad.setMaxParticipantes(rs.getInt("maxParticipantes"));
	        actividad.setOferta(rs.getString("oferta"));
	        actividad.setNuevo(rs.getInt("nuevo"));
	        actividad.setLocalizacion(rs.getString("localizacion"));
	        actividad.setFoto(rs.getString("foto"));


	        return actividad;
	    }
	}
	
	private static final class NivelesMapper implements RowMapper<NivelActividad> { 
		
	    public NivelActividad mapRow(ResultSet rs, int rowNum) throws SQLException { 
	        NivelActividad nivel = new NivelActividad();
	        nivel.setIdActividad(rs.getInt("idActividad"));
	        nivel.setNivel(rs.getString("nivel"));
	        nivel.setPrecioPorPersona(rs.getFloat("precioPorPersona"));
	
	        return nivel;
	    }
	}
	
	private static final class HorasMapper implements RowMapper<HorasInicio> { 
		
	    public HorasInicio mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	HorasInicio horas = new HorasInicio();
	    	horas.setIdActividad(rs.getInt("idActividad"));
	    	horas.setHoraInicio(rs.getString("horaInicio"));
	  
	        return horas;
	    }
	}
	
	public List<Actividad> getActividades() {
		 return this.jdbcTemplate.query("select idActividad, nombre, tipo, duracionHoras, descripcion, minParticipantes, maxParticipantes, oferta, nuevo, localizacion, foto from actividad where activa='SI' ", new ActividadMapper());
	}
	
	public List<Actividad> getActividadesDeTipo(String tipo) {
		List<Actividad> lista = this.jdbcTemplate.query("select idActividad, nombre, tipo, duracionHoras, descripcion, minParticipantes, maxParticipantes, oferta, nuevo, localizacion, foto from actividad where tipo= ? and activa='SI'", new Object[] {tipo} ,new ActividadMapper());
		if (lista != null){ return lista;}
		else {return null;}
	}
	
	public Actividad getActividad(int idActividad) {
		return this.jdbcTemplate.queryForObject("select idActividad, nombre, tipo, duracionHoras, descripcion, minParticipantes, maxParticipantes, oferta, nuevo, localizacion, foto from actividad where idActividad = ? ",  new Object[] {idActividad}, new ActividadMapper());
	}
	
	public int addActividad(Actividad actividad) {
		final String INSERT_SQL = "insert into Actividad (nombre, tipo, duracionHoras, descripcion, minParticipantes, maxParticipantes, oferta, nuevo, localizacion, foto, activa) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'SI')";
		// ,  ,, , actividad.getMinParticipantes(), actividad.getMaxParticipantes(), actividad.getOferta(), actividad.getNuevo(), actividad.getLocalizacion(), actividad.getFoto()
		final String nombre = actividad.getNombre();
		final String tipo = actividad.getTipo();
		final int horas = actividad.getDuracionHoras();
		final String descripcion = actividad.getDescripcion();
		final int min = actividad.getMinParticipantes();
		final int max = actividad.getMaxParticipantes();
		final String oferta = actividad.getOferta();
		final int nuevo = actividad.getNuevo();
		final String localizacion = actividad.getLocalizacion();
		final String foto = actividad.getFoto();
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(
		    new PreparedStatementCreator() {
		        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
		            PreparedStatement ps = connection.prepareStatement(INSERT_SQL, new String [] {"idactividad"});
		            ps.setString(1, nombre);
		            ps.setString(2, tipo);
		            ps.setInt(3, horas);
		            ps.setString(4, descripcion);
		            ps.setInt(5, min);
		            ps.setInt(6, max);
		            ps.setString(7, oferta);
		            ps.setInt(8, nuevo);
		            ps.setString(9, localizacion);
		            ps.setString(10, foto);
		            
		            return ps;
		        }
		    },
		    keyHolder);
		
		return keyHolder.getKey().intValue();
		
		//return this.jdbcTemplate.update(
		//		"insert into Actividad(nombre, tipo, duracionHoras, descripcion, minParticipantes, maxParticipantes, oferta, nuevo, localizacion, foto) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", actividad.getNombre() , actividad.getTipo() ,actividad.getDuracionHoras(), actividad.getDescripcion(), actividad.getMinParticipantes(), actividad.getMaxParticipantes(), actividad.getOferta(), actividad.getNuevo(), actividad.getLocalizacion(), actividad.getFoto() );
	}
	
	public List<NivelActividad> getNivelActividad(int idActividad){
		
		return this.jdbcTemplate.query("select idActividad, nivel, precioPorPersona from NivelActividad where idActividad=? ",  new Object[] {idActividad} ,new NivelesMapper());
	}
	
	public List<HorasInicio> getHorasActividad(int idActividad){
		
		return this.jdbcTemplate.query("select idActividad, horaInicio from HorasInicioActividad where idActividad=? ",  new Object[] {idActividad} ,new HorasMapper());
	}
	
	public NivelActividad getPrecioNivel(int idActividad, String nivel){
		
		return this.jdbcTemplate.queryForObject("select idActividad, nivel, precioPorPersona from NivelActividad where idActividad=? and nivel=?",  new Object[] {idActividad,nivel} , new NivelesMapper());
	}
	
	public void updateActividad(Actividad actividad) {
		this.jdbcTemplate.update(
				"update actividad set nombre = ?, tipo = ?, duracionHoras = ?, descripcion=?, minParticipantes=?, maxParticipantes=?, oferta=?, nuevo=?, localizacion=?, foto=? where idActividad = ?", actividad.getNombre() , actividad.getTipo() ,actividad.getDuracionHoras(), actividad.getDescripcion(), actividad.getMinParticipantes(), actividad.getMaxParticipantes(), actividad.getOferta(), actividad.getNuevo(), actividad.getLocalizacion(), actividad.getFoto(), actividad.getIdActividad() );
	}
	
	public void deleteActividad(int idActividad) {
		this.jdbcTemplate.update(
		        "update actividad set activa = 'NO' where idActividad = ?",
		        idActividad);
	}
	
	public void deleteHoraInicio(HorasInicio horasInicio){
		this.jdbcTemplate.update(
		        "delete from horasinicioactividad where idactividad = ?",
		        horasInicio.getIdActividad());
		
	}
	
	public List<String> getNivelesUnicos(){
		List<NivelActividad> listaNiveles = this.jdbcTemplate.query("select DISTINCT ON (nivel) idactividad , nivel, precioporpersona from NivelActividad", new NivelesMapper());
		List<String> lvl = new LinkedList<String>();
		for(NivelActividad n : listaNiveles ){
			lvl.add(n.getNivel());
		}
		return lvl;
	}
	
	public void addHoraInicio(HorasInicio horaInicio){
		this.jdbcTemplate.update(
						"INSERT INTO horasinicioactividad (idactividad, horainicio) VALUES (?, ?)", horaInicio.getIdActividad(), horaInicio.getHoraInicio());

	}
	
	
	public void addNivelActividad(NivelActividad nivelActividad){
		this.jdbcTemplate.update(
			"INSERT INTO nivelactividad (idactividad, nivel, precioporpersona) VALUES (?, ?, ?)", nivelActividad.getIdActividad(), nivelActividad.getNivel(), nivelActividad.getPrecioPorPersona());

	}
	
	public void deleteNivelActividad(NivelActividad nivelActividad){
		this.jdbcTemplate.update(
			"DELETE FROM nivelactividad WHERE idactividad = ? ", nivelActividad.getIdActividad());

	}
	
}