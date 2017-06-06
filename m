Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 288f385a
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jun 2017 20:38:59 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 539a5cee
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jun 2017 20:38:59 +0000 (UTC)
Received: from [172.22.213.17] (global-184-110.nat-1.net.cam.ac.uk
 [131.111.184.110])
 by mail.thalheim.io (Postfix) with ESMTPSA id 366D97547E
 for <wireguard@lists.zx2c4.com>; Tue,  6 Jun 2017 20:52:53 +0000 (UTC)
Subject: Re: Get configuration from SRV records?
To: wireguard@lists.zx2c4.com
References: <CAMRLKH9gSCEAcNrw5sougBtRU_VBf0-rqmtGXYkuvjZG_Tf-Uw@mail.gmail.com>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <177bc9e3-9ca9-7eb9-4f26-87036979130f@higgsboson.tk>
Date: Tue, 6 Jun 2017 21:52:52 +0100
MIME-Version: 1.0
In-Reply-To: <CAMRLKH9gSCEAcNrw5sougBtRU_VBf0-rqmtGXYkuvjZG_Tf-Uw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2017-05-29 13:02, Quan Zhou wrote:
> Hi list,
>
> I'm struggling to set up wg on multiple servers, what would you think
> if peer information like ports and l list of (public) nodes can be
> retrieved from DNS records?

I know a guy, who exactly did this with some scripts.
You probably want dnssec in this case.
