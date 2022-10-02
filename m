Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004A4C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Oct 2022 23:13:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 970dc8c1;
	Sun, 2 Oct 2022 23:13:52 +0000 (UTC)
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2d44d892
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Oct 2022 23:13:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1664752427; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=U/qZk1l35n5NyHE0H79Lpr5QkxBYZdYxLzzS7k9HN4GC+l1FUS621ableeIy0ol9IRrSEDTPYerFtVZMoMzo+/PA6znUKr8YYNVG7Te5+hi+7FwMLWmSLQtlFKw3DDfltSleIY/LI/cqW8Sxf29w4oGMNopovgJuimcLIyOOL+Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1664752427;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=nnDG3rvz2Braz2mj5zGRnsyN9nrGT0ATTJU/kRS3Gg0=; 
 b=kci7VeXfEmmTKlmkyuN/lbp0ZiBsG6qWg2BLoZlmq/jlVlJZSXbP8SFAlkbVo2Sj0nCyxfCA1Pk5/ja10Hpf/YNUgoTThcEl3pcohyCR3PNS1xPqGk/+GryMNGqlSXP2b5wNmQ1w+gX8lKQHFTeXbkL821g4xYeHFyOR2pacyoY=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=weichen302@zoho.com;
 dmarc=pass header.from=<weichen302@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to;
 b=bCpSQ+EpNMc8qSHWJtt3X+7Mw2pJ0GImrm5leOeA99nFcSnU6fy5WRn8sdeOG6S2W9xr8ZlWG5g2
 IJJpjerhTB4aNke+1Fd3xkCnGZon6CI0v7kZMCrx1/OMXVjw9gag  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1664752427; 
 s=zm2022; d=zoho.com; i=weichen302@zoho.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=nnDG3rvz2Braz2mj5zGRnsyN9nrGT0ATTJU/kRS3Gg0=;
 b=XwDshShz+DbPNcGfMWJlU4zFnkiWVrphsPOioTb4Zlh4RZTY8rq/yuHcEAAupUNy
 DAdvjsVsVD0eNXhYeyLQ0cHJauqhhMSD9ZYNp1RkWG0+LwKY+pIlUXBDAaTd9/SRzfW
 JFy5ULa6rvOllMTwRM/RUMUEZm8ntQUMPHfLaxC0=
Received: from tungsten (tor-exit-48.for-privacy.net [185.220.101.48]) by
 mx.zohomail.com with SMTPS id 1664752425749316.2053318306291;
 Sun, 2 Oct 2022 16:13:45 -0700 (PDT)
Date: Sun, 2 Oct 2022 18:13:22 -0500
From: Wei Chen <weichen302@zoho.com>
To: Roman Mamedov <rm@romanrm.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Iptables WireGuard obfuscation extension
Message-ID: <YzobElsJwblnVzI2@tungsten>
References: <183272e3203.12ada1173180167.8469340361616836666@zoho.com>
 <20220928163356.183baef9@nvm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928163356.183baef9@nvm>
X-ZohoMailClient: External
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Roman,

> The "Usage" section speaks of "server" and "client". However in the WG world
> there's not really a server or client per se, but all WG network members are
> peers. As such, is it possible to propose an universal set of iptables rules
> that would be fine to use on any network node?
> 
> As I understand, all INPUT packets to our local --dport need to be --unobfs,
> and all OUTPUT packets from us to any other node need to be --obfs. Right?
> 

Yes, you are right. Besides unobfs/obfs INPUT/OUTPUT chain for a local
WG installation, one can also use it on a Linux gateway, mangle the
FORWARD chain. I haven't test it but it should work.


Wei
