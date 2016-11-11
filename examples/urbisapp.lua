-------------------------------------------------------------------------------------------
-- TerraME - a software platform for multiple scale spatially-explicit dynamic modeling.
-- Copyright (C) 2001-2016 INPE and TerraLAB/UFOP -- www.terrame.org

-- This code is part of the TerraME framework.
-- This framework is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.

-- You should have received a copy of the GNU Lesser General Public
-- License along with this library.

-- The authors reassure the license terms regarding the warranties.
-- They specifically disclaim any warranties, including, but not limited to,
-- the implied warranties of merchantability and fitness for a particular purpose.
-- The framework provided hereunder is on an "as is" basis, and the authors have no
-- obligation to provide maintenance, support, updates, enhancements, or modifications.
-- In no event shall INPE and TerraLAB / UFOP be held liable to any party for direct,
-- indirect, special, incidental, or consequential damages arising out of the use
-- of this software and its documentation.
--
-------------------------------------------------------------------------------------------

-- @example Implementation of a simple application using URBIS.
-- The data of this application were extracted from Feitosa et. al (2014) URBIS-Caraguá:
-- Um Modelo de Simulação Computacional para a Investigação de Dinâmicas de Ocupação
-- Urbana em Caraguatatuba, SP.

Application{
	project = filePath("urbis.tview", "publish"),
	clean = true,
	output = "CaraguaWebMap",
	title = "URBIS-Caraguá",
	description = "The data of this application were extracted from Feitosa et. al (2014) URBIS-Caraguá:"
				.."Um Modelo de Simulação Computacional para a Investigação de Dinâmicas de Ocupação Urbana em Caraguatatuba, SP.",
	order = {"richer", "poorer", "plus", "less", "baseline", "uso", "real", "regions", "limit"},
	limit = View{
		description = "Bounding box of Caraguatatuba",
		color = "goldenrod",
		visible = true
	},
	regions = View{
		title = "Regions",
		description = "Regions of Caraguatatuba",
		select = "name",
		color = "Set2",
		value = {1, 2, 3}
	},
	real = View{
		title = "Social Classes 2010 Real",
		description = "This is the main endogenous variable of the model. It was obtained from a classification that "
					.."categorizes the social conditions of households in Caraguatatuba on 'condition A' (best), 'B' or 'C''.",
		width = 0,
		select = "classe",
		color = {"red", "orange", "yellow"},
		value = {1, 2, 3}
	},
	uso = View{
		title = "Occupational Classes (IBGE, 2010)",
		description = "The occupational class describes the percentage of houses and apartments inside such areas that "
					.."have occasional use. The dwelling is typically used in summer vacations and holidays.",
		width = 0,
		select = "uso",
		color = {{255, 204, 255}, {242, 160, 241}, {230, 117, 228}, {214, 71, 212}, {199, 0, 199}},
		value = {1, 2, 3, 4, 5}
	},
	baseline = View{
		title = "Social Classes 2025 Simulated",
		description = "The base scenario considers the zoning proposed by the new master plan of Caraguatatuba.",
		width = 0,
		select = "classe",
		color = {"red", "orange", "yellow"},
		value = {1, 2, 3}
	},
	less = View{
		title = "Urban Population Lessgrowth 2025",
		description = "The base scenario considers the zoning proposed by the new master plan of Caraguatatuba.",
		width = 0,
		select = "classe",
		color = {"red", "orange", "yellow"},
		value = {1, 2, 3}
	},
	plus = View{
		title = "Urban Population Plusgrowth 2025",
		description = "The base scenario considers the zoning proposed by the new master plan of Caraguatatuba.",
		width = 0,
		select = "classe",
		color = {"red", "orange", "yellow"},
		value = {1, 2, 3}
	},
	poorer = View{
		title = "Socioeconomic Status Poorer 2025",
		description = "The base scenario considers the zoning proposed by the new master plan of Caraguatatuba.",
		width = 0,
		select = "classe",
		color = {"red", "orange", "yellow"},
		value = {1, 2, 3}
	},
	richer = View{
		title = "Socioeconomic Status Richer 2025",
		description = "The base scenario considers the zoning proposed by the new master plan of Caraguatatuba.",
		width = 0,
		select = "classe",
		color = {"red", "orange", "yellow"},
		value = {1, 2, 3}
	}
}