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

return {
	Application = function(unitTest)
		local gis = getPackage("gis")

		local function assertFiles(dir, files)
			local count = 0
			forEachFile(dir, function(file)
				unitTest:assert(files[file:name()])

				count = count + 1
			end)

			unitTest:assertEquals(count, getn(files))
		end

		local wmsDir = Directory("WmsWebApp")
		if wmsDir:exists() then wmsDir:delete() end

		local projFile = File("wms.tview")
		projFile:deleteIfExists()

		local proj = gis.Project{
			title = "WMS",
			author = "Carneiro, H.",
			file = projFile,
			clean = true
		}

		local service = "http://www.geoservicos.inde.gov.br:80/geoserver/ows"
		local map = "MPOG:BASE_SPI_pol"
		gis.Layer{
			project = proj,
			source = "wms",
			name = "wmsLayer",
			service = service,
			map = map
		}

		local app = Application{
			project = proj,
			output = wmsDir,
			clean = true,
			simplify = false,
			progress = false,
			wmsLayer = View {
				title = "WMS",
				description = "Loading a view from WMS.",
				label = {
					boundingbox = "#ffffff"
				}
			}
		}

		unitTest:assertType(app, "Application")
		unitTest:assertType(app.project, "Project")
		unitTest:assertType(app.output, "Directory")
		unitTest:assert(app.output:exists())

		local view = app.view.wmsLayer
		unitTest:assertType(view, "View")
		unitTest:assertEquals(view.label.boundingbox, "#ffffff")
		unitTest:assertEquals(view.name, map)
		unitTest:assertEquals(view.url, service)
		unitTest:assertEquals(view.geom, "WMS")

		local appRoot = {
			["index.html"] = true,
			["config.js"] = true,
			["default.gif"] = true,
			["jquery-3.1.1.min.js"] = true,
			["publish.min.css"] = true,
			["publish.min.js"] = true,
			["geoambientev2.min.js"] = true
		}

		assertFiles(app.output, appRoot)

		projFile:deleteIfExists()
		if wmsDir:exists() then wmsDir:delete() end
	end
}
