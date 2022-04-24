Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7306C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Apr 2022 20:03:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 85bc6fb7;
	Sun, 24 Apr 2022 20:03:42 +0000 (UTC)
Received: from srv.inf7.email (srv.inf7.email [64.225.52.57])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d3abe13b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 24 Apr 2022 20:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Subject:From:Cc:References:To:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=loOlZ5/LjuaI/P2w8UQOerSV6KummQSxDcT1jY+cQp8=; b=coHNjquKm/A1DLBNNMVaJVOmdV
 c5F18nzTeaYtyPTHnLADXqoyJixM/GVrWBHpHi3+U1AZ2p8o9V+qP1LF/rz4CpgVqZl4daLAknjp1
 /aMsc+N9phyv4erkDZVUcx3+gjAuTZT2JPuIV1zJwqSj7E4JgOoQ9mBB69q+sVFjM21Jpi1NJTVyl
 2ousQIsJ4A/6WIyfD6BeBdR/Lwca1IIMI7osWxEcbyH0olr+ehskTDfHJ687F0GdjhYIdrncr5SAA
 d8N/Ug2TDGSZBDHz0huK7LULCEaUrFPkjLULp1rzlS49M0F0Bbi763is3HbbfgXSUoT17tzbTEb9T
 26lFppuQ==;
Received: from c-71-201-101-213.hsd1.il.comcast.net ([71.201.101.213]:45096
 helo=[192.168.1.11])
 by srv.inf7.email with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.95) (envelope-from <joe@solidadmin.com>) id 1niiSI-008qpk-EG;
 Sun, 24 Apr 2022 20:03:38 +0000
Message-ID: <a18d6a8a-1dcc-3093-6931-5ffb1236d287@solidadmin.com>
Date: Sun, 24 Apr 2022 15:03:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: steved@redhat.com
References: <22218021-270c-8ac9-c214-76ae4e1c1263@redhat.com>
Cc: wireguard@lists.zx2c4.com
From: Joe Doss <joe@solidadmin.com>
Organization: SolidAdmin
Subject: Re: wireguard.ko on RHEL8
In-Reply-To: <22218021-270c-8ac9-c214-76ae4e1c1263@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - srv.inf7.email
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - solidadmin.com
X-Get-Message-Sender-Via: srv.inf7.email: authenticated_id:
 jdoss@solidadmin.com
X-Authenticated-Sender: srv.inf7.email: jdoss@solidadmin.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

Hey Steve,

On 4/24/22 1:16 PM, Steve Dickson wrote:
> 
> Trying to install wireguard.ko on a RHEL8 vm (4.18.0-348.el8.x86_64)
> and I'm getting
> 
>     wireguard: module verification failed: signature and/or required key 
> missing - tainting kernel
> 
> The entire error:
> http://pastebin.test.redhat.com/1046896
> 
> is there anything at can be done about that?
> 
> I'm new to wireguard and I'm pretty impress...
> It came up in both Fedora rawhide and an
> unreleased verson of RHEL9...
> 
> We are trying to used it as our network in
> a community wide virtual NFS testing event
> called Bakeathon [1]
> 
> Again I'm new to wireguard but not to kernels ;-)
> So if you could throw something at me to
> help me get over this bum... It would be appreciated!
> 
> Note: I am not member of this list so please
> reply to be directly.

You have secure boot enabled, so you need to generate a MOK key pair, 
manually sign your wireguard.ko, and enroll your MOK cert or disable 
secure boot.

I use this script [1] to sign my NVIDIA drivers on my workstation after 
they are built via akmod.

Hope this helps!
Joe

[1]: https://gist.github.com/jdoss/495e814ef4ef599e480c31d4843eb6c0

-- 
Joe Doss
joe@solidadmin.com
