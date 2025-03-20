# Import Module WinGet

Import-Module Microsoft.WinGet.Client -ErrorAction SilentlyContinue

## Install Module WinGet if not yet installed

if ((Get-Module -Name Microsoft.WinGet.Client) -eq $null){

    Install-PackageProvider -Name NuGet -Force | Out-Null
    Install-Module -Name Microsoft.WinGet.Client -SkipPublisherCheck -Force -Confirm:$false

}

# Create GUI

Add-Type -assembly System.Windows.Forms
$WinGetUI = New-Object System.Windows.Forms.Form
$WinGetUI.Text ='WinGetUI'
$WinGetUI.Width = 900
$WinGetUI.Height = 900
$WinGetUI.StartPosition = "CenterScreen"
$WinGetUI.FormBorderStyle = 'Fixed3D'
$WinGetUI.MaximizeBox = $false
$WinGetUI.ShowInTaskbar = $true


## Create App Icon

$iconBase64      = 'AAABAAEAQEAAAAEAGAAoMgAAFgAAACgAAABAAAAAgAAAAAEAGAAAAAAAAAAAAEgAAABIAAAAAAAAAAAAAADZegLZegLZegLYeQHYeQHYeQHYeQHXeQHYegHYegLZegLYeQHXegHXeQHYeQHYeQHYeQHYeQHYeQHYeQHYeQHYeQHYeQHYeQHYeQHYeQHYeQHXegHXegHYeQHYeQHYeQHYeQHYeQHYeQHYeQHYeQHYeQHZegLZegLZegLZegLZegLZegLYeQHXdwHYdwHYdwHZdwHZdwHZdwHYdwHXdwHYeAHYeQHZeQHaeALZdwHZdwHYeAHZeQHYeQHZeQHbegLYeQHYeQHXeADXeADXeADXeADXeADXegHXegHWeQDWeQDWeQDXeADWdwDXeADXeADXeADXeADXeADXeADXeADXeADXeADXeADXeADXeADXeADXeADXeADWeQDWeQDWeQDXegHXeQHXeAHXeADXeADXeADXeADYeQHYeQHYeQHYeQHYeQHYeQHYeQHWdwDWdgHXdgHYdgDYdgDXdgDWdgDWdwDXdwHXdwHYdwHYdgHXdgHXdgHXdwHXeADXeADZeQHYeQHXdwDXdwDXdwDWeQDYeQHXeQHWeQDWeADWeADWeADWeADXeADWeADXdwDXdwDXeADXeADXeADXeADXeADXeADXeADXeADXeADXeADXeADXeADWeADVeQDXeQDWeAHVeAHWdwHXeALXeALWdwLVdwHVeALaeAHYeALYeQHYeQHYeQLYeQHYeQHYeQHXeAHXdwHXdgDYdgDYdgDXdgDWdwHXdwHXdwDWdwDXdwHXdwHXdwHWdgDXeADXeADYeQHZeQHXdwHXdwHXeAHXegHWeQDWeQDWeQDXdwHXdwHXdwHXdwHXeADXeADXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXeADXeADXeADYeADaeAHXeALVdwPWeQLVeQLTdgTTeAfYdwPaeQHVeAPXdgTVeAHWeAHaegHWeQLZeQHZeQHYeQHXeALXdwHWdgDXdgDYdgDYdgDXdgDWdgDWdwDXeADXdwHWdgDXdwHXdwHXdwHXeADZeQHaeALXdwHXeQHWeQHWeAHWeAHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXeADXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXeQDZeALWdQTOgSHiuoLdsXHSdwTVeAPQehHsz53VkDPTdgLWdwHXeAHWdwHXeAHYeQLYeALXeAHWdgDWdgDXdgDYdgDXdgDXdgDWdgDXdwDXdwHWdgDXdwHXdwHXdwHXeADZeQHaeQLXeQHWeQDWeAHWeAHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHYeALYeAHXdwHXdwHWdgDXdwHXdwHXdwHXdwHXdwHXdwHYeALYeALXdwHXeAHUeALVdgXMfiHiuYL18N79+vLftoLWdwPXeQLTeBD68t759ufkx5bPfRjWdgLWdgHWdgDXdwHYeQHYeQHXeADWdgDWdgDYdgDYdgDYdgDWdgDWdgDXdwHXdwHXdwHXdwHXdwHXeADZeQHZegLXeQHWeADXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHYeALXdwHXdwHXdwHXdwHXdwHXdwHWdgDXdwHYdwHXdwHXeAHXdwHXdwHXdwDYdwHWdwLXdwPRgCDguX/68dz8+fL7+fT6+fbgtoLWdwPWeAHOdxP48d/5+/f8+/b58d/Yr2vQeAzWdgDXdgDWdwDYeQHXeALYdwHWdwDYdQHYdgDYdgDXdgDWdgDXdwHXdwHXdwHXdwHXdwHXdwDZeQHYeQHXdwHXdwHXdwHXeADXeADXeADXeADXdwHYeALXdwHXdwHXdwHXdwHXdwHXdwHXeADXeADXdwHXdwHVeQHXegHWdwPWdwPXdwHVdwLUdgLQgCDiuX768Nz8+vP8+vT8+fX9+fb7+ffgtoDWeAPXdwHPeRD68eD7+/b7/Pj9+/j6+vfx5cjSlELUdgXXdgDXdgHYeADYeAHWeAHXdwHXdwHYdgDYdgDWdgDWdgDXdwDXeADYdwDXdwHWdgDZeAHYeQHXdwHXdwHXdwHXeADXeADXeADYeQHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXeADXeADXdwHXdwHXdgLXdgHWeAHVeALTdgTOexbgsXL57Nb6+PL8+vH8+Pb6+Pf8+/L++vb7+vbgtoDWeAPXeAHPeRD78eD9+/b8/Pb8/Pf7+vf8+fb7+/DlxJDOgBzVdgLUdgPZdwHadwLWeAHXdgDYdgDYdgDWdgDWdgDXdwDXeADYdwDXdwHWdgDYdwHYeQHXdwHXdwHXdwHXeADXeADYeQHXeADXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHWdgDWdgDXdwHXdwHWeAHTdwLYdATNeRnbr3L569X59/L89vP4+PT6+vf+/O77+/T8+fb9+fb7+vXft4DVdwLXeAHPeRD78eD9+vb5+/f++/f8/fb9+/j7+/b6+/j69+XZrGjWewvYeQHZeQLUeADWdgDXdgDYdgDXdgDWdgDWdgDXeADYeADXdwHWdgDZdwHYeQHXdwHXdwHXdwHXeADYeQHXeADXeADXdwHXdwHXdwHXdwHWdwLXdwHXdwHXdwHWdwDXdgDXdwHXdwHWdQLQfBbcsHH37NT89/H89/P6+PL7+PH27tfXtnS7hCHOq2X8+/P9+fb6+fXgt4DVeAPXeAHPeRD68N/++/b++/X6+/f7+/n9+/f8+vf8+vf8+/f8+/XasHPXdwLYdwLXeAHYdgDWdgDYdgDYdgDXdgDWdgDXdwDXeADXdwHXdgDZdwHYeQHXdwHXdwHXdwHXeADXeADXdwHXdwHXdwHXdwHXdwHXdwHWeALXeAHWdgLWdgLYdwHWeALVdwLMexresHP46tD49/H8+fH6+PT9+fL26dHWs2q+gBXBegLBewG0dw38+uj9+fX6+fTft3/WdwPXeAHQeBH679/9+ff++/f8+/f8+/f9/Pj++/f++/f++/f+/fjduIbYdgPXeQHXdwDWdgDWdgDXdgDYdgDXdwHXdwHXdwHXdwHXdwHXdgDZdwHYeQHXdwHXdwHYeALXeADXeADXdwHXdwHWeAHXdwHXdwHXdwHZdgLXdwLWeAHVeAHRdwPPfRfdr2/26tP69+779+/79/H7+O/x5sbTrWO/gBDBewHBewHAegHAegHGlz/8+u/8+PT5+PTetn/VdwLYeAHQeBH67+D9+vb++/f++/f8+/f8+/f+/Pj++/f9+vb+/PjduYTZdwLXeQDYeAHXeAHWdgDXdgDYdgDXdgDWdgDWdgDXdwHXdwHXdgDZdwHYeQHXdwHYeALXdwHXeADXeADXdwHXdwHXdwHXdwHXdwHXdwHTeAHUdwPWdgPMfBner2/26tD69/H7+O/49/H6+PH9+O7aun68fw2/eQPDewDBegHCegG9egPEjjD47NP7+PP7+PP5+PPftYDWdwPYeAHReRH68OD9+vb9+vb++/f++/f8+/f8+/f++/f++/f+/PfeuYTZeALXeQHZeAHYeQHWdwDWdgDXdgDYdgDXdgDWdgDXdwHXdwHYdwHZdwHYeQHXdwHXdwHXdwHXeADXeADXdwHXdwHXdwHXdwHXdwLWeAHVdgPPfhnesHH36dL7+PH6+O/6+PD79/H6+PH8+PHm1668egbCegHBewDBegG+egbHlDXlzp/99+n7+PP8+PP8+PP59/PftX/WdwLYeAHQeRD68OD++vb9+vb9+vb++/f8+/f8+/f+/Pj++/f++/fduIPYdwLYeQHZeQHXegHXdwDWdgDWdgDXdgDYdgDWdgDWdgDXdwHYdwHaeALYeQHXdwHXdwHXdwHXeADWdwDWdgDWdgDWdwLYeAHVdwPRdgjbqWn46dL69/H89/D7+PD7+e/99/H79/H89/L7+PDbv4fCewHBewG+egbJmD7o1aj89+v8+PP8+PP8+fP8+PP8+PP79/PetH/VdgLXeAHOeRD68N/9+vb9+vb9+vb++/f++/f8+/f8+/f9/Pj++/bduIPXdwLYeQHYeQHYeQHYeALWdgDWdgDXdwHXdwHXdwHWeAHXdwHXdwHZeQHZegLXdwHXdwHXdwHXdwDWdgDWdgDWdgDWdwLWdwPZdwHcpV789uv79+78+PD99/H7+fP99/L7+PD6+PD8+O/7+PD38uDQq2HJnUvo06X8+Ov9+e/8+PH8+PP8+PP8+PP8+PP8+PP7+PPetX7UdgLXeAHOeRD68N/9+vb9+vb9+vb9+vb++/f9+/f8+/f9/Pj++/bdt4LWdwLYeQHYeQHYeQHYeQHWdgDWdgDXdwHXdwHXdwHWeAHXdwHXdwHZeQHYeQHXdwHWdgDWdgDWdgDWdgDWdgDXeADWeADTdgPMdQr35cf39vL7+PD49ebl0qTeyZr59uf6+fH8+PD69/H99vD8+PD9+O/9+e78+PD8+PD6+PH79/L8+fH8+PL8+PP8+PP7+PP7+PPetX7UdgLXeADPeRD68N/9+vb9+vb9+vb9+vb++/f++/f8+/f8+/f++/fduIPWdwLYeQDXeADYeQHYeQHXeADWdgDXdwHWdgDXdwHWeAHXdwHXeADZeQHYeQHXdwHXdwHXdwHWdgDWdgDWdwDWeQDWeQHWeALJdhX88t769/H69uXJnU2+egO/egPAiynp3Lb7+fL8+O/99/D6+O/+9vH79/H8+PD89/H8+PD9+O/7+PD8+fL8+PP8+PP69/L7+PPetX7UdgLWdwDOeRD68N/8+fX++/b9+vX9+vb9+vb++/f9+/f7+vb+/Pfdt4LWdgLYeQHYeQHYeQHYeQHXeAHWdgDXdwHXdwHXdwHWeAHXdwHXeADZeQHYeALXdwHXdwHXdwHXdwHXdwHVdwDVdwDWdwHXdwLJdxT98t77+PDu27i9egTBewHAewDDewC9fAnRrWT39OL89/P7+e779/D69vH9+O/89/H6+e/89/H7+PD7+PD8+fH8+fH69/L69/Ldtn7VdgLWdwDPeBD67979+fb9+vX9+vb9+vb9+vb++/f9+/f8+/f9/PfduITXdgLYdwHYeQDZeQHYeQHYeQHWdgDWdgDXdgDYdgDXdgDWdwHXdwHZeQHYeALXdwHXdwHXdwHXdwHXdwHWeAHXdwHWeAHXdwLIdxP98t77+PDy4r++fQvCegHAewDBegHCewHAegK/iSfp2K/7+fL89u/7+O76+O799vD+9+/6+PH7+PD7+PD7+PD8+fH79/L69/Ldtn7VdgLXdwDPdxD67979+fb9+vX++/b9+vb9+vb++/f++/f8+/f9/PfduITWdgLYdwHYeQDYeQHYeQHYeQHWdgDWdgDXdgDYdgDXdgDWdwHXdwHZeQHYeALXdwHXdwHXdwHXdwHWeAHWeAHXdwHWdwDXdwHIdxP98t77+PD89uvlyZnDhR6/ewG/ewLBegHCewDDegG/fAjOqV/38d349/L59/D69+789vH8+O/7+PD7+PD7+PD7+fH79/L69/LdtX7VdgLXdwDPdxD67978+fX9+vX++/b9+vb9+vb9+vb++/f8+/f9/PfcuITWdgLXdwHYegDYeQHYeQHYeQHXdwDWdgDXdgDYdgDXdgDWdwHWdwHZeQHYeALXdwHXdwHXdwHXdwHWeAHWeAHXdwHWdwDWdwLJeBP98t78+PD8+PH7+O/369HQp1i/fAjAewHCegDAewG/ewHAegG+iSTl06f8+O/49/D79+/7+PD7+PD7+PD7+PD7+PD7+PH69/LdtX7VdgLXdwDPdxD67978+PX9+vX9+vX++/b9+vb9+vb++/f9+/f8+/fct4TWdgLXdwHYegDYeQHYeQHYeQHXeAHWdgDXdgDYdgDXdgDWdwHWdwHZeQHYeQHXdwHXdwHXdwHWeQDWeQDWeAHXdwHVdwHWeAHIdxT88t77+O/6+PD69+/69+/79+vp0aHCjCfBegLAewDDegHAewHCegC6ewfPsG78+vL79/H7+O/7+PD7+PD7+PD7+PD79/H69/PetX7UdwLXdwDReBD67t38+PT9+vX9+vX++/b9+vb9+vT8+vX9+vX7+vfdt4PWdgLXeAHYeQDYeAHYeQHYeQHXeADXdwHXdwHXdwHWdwHWeAHWdwDZeALYeQHXdwHXdwHXdwHWeQDWeQDXdwHXdwHVdwHXeAHIdxT88t37+O/7+PD69+/69+/59+/69/D47NLUp1u9ewbDegLAfADAewDBegG+iSj8+ej7+vP8+PT69+/7+PD7+PD7+PD79/H69/PetX7TdwLXdwDRdxD67t38+PT9+vX9+vX++/b9+vb5+fb7+vf8+vb9+/bduIPWdgLXeAHYeQDYeAHYeQHYeQHXeADXdwHXdwHXdwHXdwHWeAHWdwDZeALYeQHXdwHXdwHXdwHWeQDXeADXdwHWeAHVdwHXeAHKdxX88t77+O/7+PD69+/69+/69+779vD4+O789+rr06bBgxfAewHEewDAegHOpFn69+769/D7+PH7+PD99/D7+PD7+PD79/H69/PetX7UeALXdwDReBD67t38+PT9+vX9+vX++/b9+vb7+fP8+fP6+vb5+vbduILWdgLXeAHYeQDZeQHYeQHYeQHXeADXdwHXdwHYdwHXdwHWeAHWdwDYeAHYeQHXdwHXdwHXdwHWeQDXeADXdwHWeAHVdwHXeAHKdxX88d78+O/7+PD69+/69+/49/D79vD69+779vH479W+ghXCewDAegK+ghbx6Mn99+/69/D69+/8+PD99/D7+PD6+PD79/H69/PetX7UeALXdwDReBD67t38+PT9+vX9+vX9+vb9+vb5+Oz7+O34+ff7+/XduIPWdgLXeAHYeQDZeQHYeQHYeQHXeADWdgDWdgDYdgDXdgDWdwHWdwDYeAHYeALXdwHXdwHXdwHWeQDXeADXeADWdwDVdwHXeAHJdxT88t38+O/7+PD69+/69+/79+/79+/69+789+7SqVzBewHCewC+eQTdxo/6+O769/D69+/79/D7+PD99/D7+PD7+PD79/H69/LetX7VdwLYdwLPeBL67tz79/T8+fX9+vL9+e3t1K3Uk0LSk0Ht06n7+OzcuYPXdgLZeAHXeAHZeQHYeQHYeQHXeADXdwHXdwHXdwHXdwHWeAHWdwDZeAHYeALXdwHXdwHXdwHWeQDXeADXeADWdgDWdwHWeAHJdxT88t78+O/7+PD7+PD69+/69vD79vH59+/t2bC9ewfDegHAegLInkv89+n69+/69+/69+/7+PD7+PD99/D7+PD7+PD79/H69/LetX7UdwPTeQLTeBH67d78+fL89+zs063UlELSdgnVdwLUdgTQdgjSkUDan0vVdwPadwHYeALYeQHYeQHYeQHXeADXdwHXdwHXdwHXdwHWeAHWdwDZeQHYeALXdwHXdwHXdwHWeQDXeADXeADWdgDWdwHWdwHJdxT88t78+O/7+PD7+PD69+/59+/6+O/79OLGkDHAegLBfAG+ghjx6cv79+/69+/69+/69+/7+PD7+PD99/D7+PD7+PD69/D69/LetX7UdwLUeALReBH57dXt1K3UkkPQdgbXeALXeAHZeQLYeQDYeQHVdwPUdwTVeALYdwHYeALXegHYeQHYeQHXeADXdwHXdwHXdwHXdwHWeAHWdwDZeQHYeALXdwHWdgDWdgDWeQDXeADXeADWdwDWdgDVdwDJdxT88t78+O/7+PD7+PD69+/7+O789vDbvX+/egPBfADAegPdxY789+759/D69+/69+/7+PD7+PD7+PD99/D7+PD7+PD69/D69/LetX7UdwLZeADUdgrZkTvUcwzXdwPYdwLWeQHXeQDWeALXeALYeAHUeAHWeQLYdwHWeQDXdwLYegHYeQHYeQHXeADXdwHXdwHXdwHXdwHWeAHWdwDZeQHYeALXdwHXdwHXdwHWeAHXdwHXdwHXdwHWdwHWdwHIeBP88t37+PD8+e/89/D6+PD5+PD05svBgBS/ewHBewHInEj69+v59/D89+/69+/69+/7+PD7+PD6+PD8+PD7+PD79/D69/D79/LetH/TdwPTeALUdgTPdAfOdQfOdQnNdAfSdAbMcwjMdQfTdgPUdgTZeALVeQHaeQHVeQHYeAHaeQHYeQHYeQHXeADWdgDXdgDXdgDWdgDWdwHWdwDYeAHYeALXdwHXdwHXdwHWeAHXdwHXdwHXdwHVdwHWdwHHeBP88t37+PD6+PD7+PH7+e/99+3QplTAewHBewG/fxPw58f89+779+/69vD7+PD7+PD7+PD6+PD69+/7+PD7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dgDWdgDWdgDWdgDWdgDWdgDXeADXeADXeADXeADXdwHXdwHXdwHXdwHWdgDWdgDXdwDXeADXeADXeADXeADXeADXeADXeADZegDXdwHWdgHVdgDWeAHWdgDWdgDXdwHXdwHXdwHXdwHXdwHXdwHXeADXdwHWdgDWdgDXdwHXdwHXdwHXdwHXeAHXdwHXdwHXdwHXdwHXeADXeADWdwDYeQDXeQDXdwHXdwLXeAHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHYdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXeADXeADZeQHYeQLXdwHWdwDWeAHWdgDWdgDXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHWdgDWdgDXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXdwHXeADXeAHXdwHXdwHWdwDXdwHXdwHXdwHWdgDWdgDXdwHXdwHWdgDWdgDWdgDWdgDWdgDWdgDXdwHXdwHXdwHXdwHWdgDXdgDYdgDYdgDXdgDWdgDWdgDWdgDXdwHXdwHXdwHXdwHWdgDWdgDXdwHXeADZeQHZegHYeQHYdwHYdwHXdwHXdwHXdwHXdwHXeAHXdwHXeAHXeAHYeQHYeQHYeAHYeAHYeQHYeQHYeQHYeQHYeALYeALYeALXeAHXeAHYeALYeALYeALYeALXeAHZdwHZeAHYeAHXdwHXdwHXdwHXdwHXdwHXdwHXdwHYeAHYeAHYeAHXeAHXeAHXdwLXdwLYeALZdwHZdwHZdwHXdwHYeALYeAHYeAHXeAHXdwLYeALYeALYeALYeALYeALYeALZegIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=='
$iconBytes       = [Convert]::FromBase64String($iconBase64)
$stream          = [System.IO.MemoryStream]::new($iconBytes, 0, $iconBytes.Length)
$WinGetUI.Icon   = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::new($stream).GetHIcon()))


## Add Tab Control

$WinGetUI_TabControl = New-object System.Windows.Forms.TabControl
$WinGetUI_TabControl.Size = "900,900"
$WinGetUI_TabControl.Location = "0,0"
$WinGetUI_TabControl.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)

### Add Tab Control to GUI

$WinGetUI.Controls.Add($WinGetUI_TabControl)

## Add Install Tab

$Tab_Install = New-object System.Windows.Forms.Tabpage
$Tab_Install.DataBindings.DefaultDataSourceUpdateMode = 0
$Tab_Install.UseVisualStyleBackColor = $True
$Tab_Install.Name = "New Apps"
$Tab_Install.Text = "New Apps"
$Tab_Install.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)

### Add Install Tab to GUI

$WinGetUI_TabControl.Controls.Add($Tab_Install)

## Create Search Field Textbox

$WinGetSearch_TextBox = New-Object System.Windows.Forms.TextBox
$WinGetSearch_TextBox.Location = New-Object System.Drawing.Size(20,20)
$WinGetSearch_TextBox.Size = New-Object System.Drawing.Size(850,40)
$WinGetSearch_TextBox.AutoSize = $true
$WinGetSearch_TextBox.Text = "7-zip"
$WinGetSearch_TextBox.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)
$WinGetSearch_TextBox.TextAlign = "Center"

### Add Search Field Textbox to GUI

$Tab_Install.Controls.Add($WinGetSearch_Textbox)


## Create Search Button

$WinGetSearch_Button =  New-Object System.Windows.Forms.Button
$WinGetSearch_Button.Location = New-Object System.Drawing.Size(20,70)
$WinGetSearch_Button.Size = New-Object System.Drawing.Size(850,60)
$WinGetSearch_Button.Text = "Search WinGet Store"
$WinGetSearch_Button.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)

### Add Search Button to GUI

$Tab_Install.Controls.Add($WinGetSearch_Button)


## Create App Listbox

$WingetApps_ListBox = New-Object System.Windows.Forms.ListBox
$WingetApps_ListBox.Location = New-Object System.Drawing.Size(20,140)
$WingetApps_ListBox.Size = New-Object System.Drawing.Size(850,300)
$WingetApps_ListBox.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)

### Add App Listbox to GUI

$Tab_Install.Controls.Add($WingetApps_ListBox)


## Create App Info Button

$WinGetInfo_Button =  New-Object System.Windows.Forms.Button
$WinGetInfo_Button.Location = New-Object System.Drawing.Size(20,440)
$WinGetInfo_Button.Size = New-Object System.Drawing.Size(425,60)
$WinGetInfo_Button.Text = "Show App Info"
$WinGetInfo_Button.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)

### Add App Info Button to GUI

$Tab_Install.Controls.Add($WinGetInfo_Button)


## Create App Install Button

$WinGetInstall_Button =  New-Object System.Windows.Forms.Button
$WinGetInstall_Button.Location = New-Object System.Drawing.Size(445,440)
$WinGetInstall_Button.Size = New-Object System.Drawing.Size(425,60)
$WinGetInstall_Button.Text = "Install"
$WinGetInstall_Button.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)
$WinGetInstall_Button.BackColor = "LightGreen"

### Add App Install Button to GUI

$Tab_Install.Controls.Add($WinGetInstall_Button)


## Create Output Textbox

$Output_Textbox = New-Object System.Windows.Forms.TextBox
$Output_Textbox.Location = New-Object System.Drawing.Size(20,510)
$Output_Textbox.Size = New-Object System.Drawing.Size(850,210)
$Output_Textbox.Font = [System.Drawing.Font]::new("Lucida Console", 12, [System.Drawing.FontStyle]::Regular)
$Output_Textbox.Multiline = $True
$Output_Textbox.BackColor = "LightGray"
$Output_Textbox.AutoSize = $true

### Add Output Textbox to GUI

$Tab_Install.Controls.Add($Output_Textbox)


## Add Search Button Click Logic
      
$WinGetSearch_Button.Add_Click(

    {
        
        $WingetApps_ListBox.Items.Clear()
                                               
        $WinGetFind_Outputs = Find-WinGetPackage $WinGetSearch_TextBox.Text -Source winget | Select-Object Name, Version, Id | Sort-Object Name
        
        foreach ($WinGetFind_Output in $WinGetFind_Outputs){

            $WingetApps_ListBox.Items.Add($WinGetFind_Output.Name)

        }
                
    }
    
)


## Add App Info Button Click Logic

$WinGetInfo_Button.Add_Click(

    {
        
        if ($WingetApps_ListBox.SelectedItem -ne $null){

            $WinGetInfo_App = Find-WinGetPackage -Name $WingetApps_ListBox.SelectedItem -MatchOption Equals -Source winget | Select-Object Name, Version, Id
            $Output_Textbox.Text = "   Name: " + $WinGetInfo_App.Name + "`r`n" + "Version: " + $WinGetInfo_App.Version + "`r`n" + "     Id: " + $WinGetInfo_App.Id

            }
    }

)


## Add App Install Click Logic

$WinGetInstall_Button.Add_Click(

    {
        
        if ($WingetApps_ListBox.SelectedItem -ne $null){

            Install-WinGetPackage -Name $WingetApps_ListBox.SelectedItem -Source winget -MatchOption Equals -Force

            if ($? -eq $true){

                $Output_Textbox.Text = $WingetApps_ListBox.SelectedItem + " was installed."

            }

        }

    }

)

## Add Update/Uninstall Tab

$Tab_Update = New-object System.Windows.Forms.Tabpage
$Tab_Update.DataBindings.DefaultDataSourceUpdateMode = 1
$Tab_Update.UseVisualStyleBackColor = $True
$Tab_Update.Name = "Installed Apps"
$Tab_Update.Text = "Installed Apps"
$Tab_Update.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)

### Add Update/Uninstall Tab to GUI

$WinGetUI_TabControl.Controls.Add($Tab_Update)


## Create Search Field Textbox

$InstalledAppsSearch_TextBox = New-Object System.Windows.Forms.TextBox
$InstalledAppsSearch_TextBox.Location = New-Object System.Drawing.Size(20,20)
$InstalledAppsSearch_TextBox.Size = New-Object System.Drawing.Size(850,40)
$InstalledAppsSearch_TextBox.AutoSize = $true
$InstalledAppsSearch_TextBox.Text = ""
$InstalledAppsSearch_TextBox.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)
$InstalledAppsSearch_TextBox.TextAlign = "Center"

### Add Search Field Textbox to GUI

$Tab_Update.Controls.Add($InstalledAppsSearch_Textbox)


## Create Find Installed Apps Button

$InstalledAppsSearch_Button =  New-Object System.Windows.Forms.Button
$InstalledAppsSearch_Button.Location = New-Object System.Drawing.Size(20,70)
$InstalledAppsSearch_Button.Size = New-Object System.Drawing.Size(425,60)
$InstalledAppsSearch_Button.Text = "Find Installed WinGet Apps"
$InstalledAppsSearch_Button.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)

### Add Find Installed Apps to GUI

$Tab_Update.Controls.Add($InstalledAppsSearch_Button)


## Create Find Updateable Apps Button

$UpdateableAppsSearch_Button =  New-Object System.Windows.Forms.Button
$UpdateableAppsSearch_Button.Location = New-Object System.Drawing.Size(445,70)
$UpdateableAppsSearch_Button.Size = New-Object System.Drawing.Size(425,60)
$UpdateableAppsSearch_Button.Text = "Find Updateable WinGet Apps"
$UpdateableAppsSearch_Button.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)

### Add Find Updateable Apps to GUI

$Tab_Update.Controls.Add($UpdateableAppsSearch_Button)


## Create App Listbox

$InstalledApps_ListBox = New-Object System.Windows.Forms.ListBox
$InstalledApps_ListBox.Location = New-Object System.Drawing.Size(20,140)
$InstalledApps_ListBox.Size = New-Object System.Drawing.Size(850,300)
$InstalledApps_ListBox.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)

### Add App Listbox to GUI

$Tab_Update.Controls.Add($InstalledApps_ListBox)


## Create Show App Info Button

$InstalledAppInfo_Button =  New-Object System.Windows.Forms.Button
$InstalledAppInfo_Button.Location = New-Object System.Drawing.Size(20,440)
$InstalledAppInfo_Button.Size = New-Object System.Drawing.Size(283.33,60)
$InstalledAppInfo_Button.Text = "Show App Info"
$InstalledAppInfo_Button.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)

### Add Show App Info Button to GUI

$Tab_Update.Controls.Add($InstalledAppInfo_Button)


## Create App Update Button

$AppUpdate_Button =  New-Object System.Windows.Forms.Button
$AppUpdate_Button.Location = New-Object System.Drawing.Size(303.33,440)
$AppUpdate_Button.Size = New-Object System.Drawing.Size(283.33,60)
$AppUpdate_Button.Text = "Update App"
$AppUpdate_Button.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)

### Add App Update Button to GUI

$Tab_Update.Controls.Add($AppUpdate_Button)


## Create App Uninstall Button

$AppUninstall_Button =  New-Object System.Windows.Forms.Button
$AppUninstall_Button.Location = New-Object System.Drawing.Size(586.66,440)
$AppUninstall_Button.Size = New-Object System.Drawing.Size(283.33,60)
$AppUninstall_Button.Text = "Uninstall App"
$AppUninstall_Button.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)
$AppUninstall_Button.BackColor = "Red"

### Add App Uninstall Button to GUI

$Tab_Update.Controls.Add($AppUninstall_Button)


## Create Output Textbox

$InstalledApps_Textbox = New-Object System.Windows.Forms.TextBox
$InstalledApps_Textbox.Location = New-Object System.Drawing.Size(20,510)
$InstalledApps_Textbox.Size = New-Object System.Drawing.Size(850,210)
$InstalledApps_Textbox.Font = [System.Drawing.Font]::new("Lucida Console", 12, [System.Drawing.FontStyle]::Regular)
$InstalledApps_Textbox.Multiline = $True
$InstalledApps_Textbox.BackColor = "LightGray"
$InstalledApps_Textbox.AutoSize = $true
$InstalledApps_Textbox.ScrollBars = "Vertical"

### Add Output Textbox to GUI

$Tab_Update.Controls.Add($InstalledApps_Textbox)


## Create Update All Apps Button

$UpdateAllApps_Button =  New-Object System.Windows.Forms.Button
$UpdateAllApps_Button.Location = New-Object System.Drawing.Size(20,730)
$UpdateAllApps_Button.Size = New-Object System.Drawing.Size(850,60)
$UpdateAllApps_Button.Text = "Update All Apps"
$UpdateAllApps_Button.Font = [System.Drawing.Font]::new("Segoe UI Variable", 12, [System.Drawing.FontStyle]::Regular)
$UpdateAllApps_Button.BackColor = "LightGreen"

### Add Update All Apps Button to GUI

$Tab_Update.Controls.Add($UpdateAllApps_Button)

## Add App Info Button Click Logic

$InstalledAppsSearch_Button.Add_Click(

    {
        
        $InstalledApps_ListBox.Items.Clear()

        $InstalledAppsSearch_TextBox_Text = $InstalledAppsSearch_TextBox.Text
        
        $InstalledAppsSearch_Outputs = Get-WinGetPackage | Where-Object {($_.Source -eq "winget") -and ($_.Name -like "*$InstalledAppsSearch_TextBox_Text*")} | Sort-Object Name
                                               
        foreach ($InstalledAppsSearch_Output in $InstalledAppsSearch_Outputs){

            $InstalledApps_ListBox.Items.Add($InstalledAppsSearch_Output.Name)

        }

    }
    
)


$UpdateableAppsSearch_Button.Add_Click(

    {

        $InstalledApps_ListBox.Items.Clear()

        $InstalledAppsSearch_TextBox_Text = $InstalledAppsSearch_TextBox.Text

        $UpdateableAppsSearch_Outputs = Get-WinGetPackage | Where-Object {($_.Source -eq "winget") -and ($_.IsUpdateAvailable -eq $true) -and ($_.Name -like "*$InstalledAppsSearch_TextBox_Text*")} | Sort-Object Name

        foreach ($UpdateableAppsSearch_Output in $UpdateableAppsSearch_Outputs){

            $InstalledApps_ListBox.Items.Add($UpdateableAppsSearch_Output.Name)

        }

    }

)


## Add Show App Info Button Click Logic

$InstalledAppInfo_Button.Add_Click(

    {
        
        $InstalledApps_Textbox.Clear()

        $InstalledAppInfos = Get-WinGetPackage $InstalledApps_ListBox.SelectedItem

        foreach ($InstalledAppInfo in $InstalledAppInfos){

            $InstalledApps_Textbox.Text += "      Name: " + $InstalledAppInfo.Name + "`r`n" + "   Version: " + $InstalledAppInfo.InstalledVersion + "`r`n" + "        Id: " + $InstalledAppInfo.Id + "`r`n" + "Updateable: " + $InstalledAppInfo.IsUpdateAvailable + "`r`n" + "`r`n" 

        }

        
    }

)


## Add App Uninstall Button Click Logic

$AppUpdate_Button.Add_Click(

    {

        $InstalledApps_Textbox.Clear()

        if ($InstalledApps_ListBox.SelectedItem -ne $null){

            Get-WinGetPackage $InstalledApps_ListBox.SelectedItem -Source "winget" | Where-Object IsUpdateAvailable -eq $true | Update-WinGetPackage -Force -Confirm:$false

            if ($? -eq $true){

                $InstalledApps_Textbox.Text = $InstalledApps_ListBox.SelectedItem + " was updated to version " + (Get-WinGetPackage $InstalledApps_ListBox.SelectedItem -Source "winget").InstalledVersion + "."

            }

        }

    }

)


## Add App Uninstall Button Click Logic

$AppUninstall_Button.Add_Click(

    {

        if ($InstalledApps_ListBox.SelectedItem -ne $null){

            Get-WinGetPackage $InstalledApps_ListBox.SelectedItem | Uninstall-WinGetPackage -Mode Interactive 

            if ($? -eq $true){

                $InstalledApps_Textbox.Text = $InstalledApps_ListBox.SelectedItem + " was uninstalled."

            }

        }

    }

)


## Add Update All Apps Button Click Logic

$UpdateAllApps_Button.Add_Click(

    {

        $InstalledApps_Textbox.Clear()

        $UpdateableApps = Get-WinGetPackage -Source "winget" | Where-Object IsUpdateAvailable -eq $true

        foreach ($UpdateableApp in $UpdateableApps){

            $UpdateableApp | Update-WinGetPackage -Force -Confirm:$false

            if ($? -eq $true){

                $InstalledApps_Textbox.Text += (Get-WinGetPackage $UpdateableApp.Name -Source "winget").Name + " was updated to version " + (Get-WinGetPackage $UpdateableApp.Name -Source "winget").InstalledVersion + "`r`n"

            }

        }

    }

)

# Run GUI

[system.windows.forms.application]::run($WinGetUI)