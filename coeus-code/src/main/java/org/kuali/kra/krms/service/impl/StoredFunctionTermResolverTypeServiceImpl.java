/*
 * Copyright 2005-2013 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.krms.service.impl;

import org.kuali.kra.krms.FunctionTermResolver;
import org.kuali.kra.krms.StoredFunctionResolver;
import org.kuali.rice.krms.api.repository.function.FunctionDefinition;

import java.util.List;
import java.util.Set;

/**
 * This class is used for calling appropriate Stored Function Resolver from KRMS Type Service
 */
public class StoredFunctionTermResolverTypeServiceImpl extends FunctionTermResolverTypeServiceBase {

    /**
     * @see org.kuali.kra.krms.service.impl.FunctionTermResolverTypeServiceBase#createFunctionResolver(java.util.List, java.util.Set, java.lang.String)
     */
    @Override
    public FunctionTermResolver createFunctionResolver(List<String> functionParams, Set<String> termResolverParams, String output, FunctionDefinition functionTerm) {
        FunctionTermResolver functionResolver = new StoredFunctionResolver(functionParams,termResolverParams,output);
        return functionResolver;
    }

}
