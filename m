Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51362897
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 14:12:05 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5dc541ce
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 14:12:05 +0000 (UTC)
Received: from d53-64-244-190.nap.wideopenwest.com ([64.53.190.244]:46353
 helo=[192.168.1.155])
 by conquer.yellowcord.com with esmtpsa (TLSv1.2:DHE-RSA-AES128-SHA:128)
 (Exim 4.85) (envelope-from <joe@solidadmin.com>) id 1dvP79-0007pO-W8
 for wireguard@lists.zx2c4.com; Fri, 22 Sep 2017 09:39:36 -0500
Subject: Re: 2-factor auth options
To: wireguard@lists.zx2c4.com
References: <20170921192148.GB2587@gmail.com>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <6cfdeab9-4554-0eb3-847c-fa8d7c020a7d@solidadmin.com>
Date: Fri, 22 Sep 2017 09:39:35 -0500
MIME-Version: 1.0
In-Reply-To: <20170921192148.GB2587@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 09/21/2017 02:21 PM, Konstantin Ryabitsev wrote:
> Hello, all:
> 
> Is there any mechanism to add some kind of 2-factor authentication
> mechanism either via

Throwing my hat into this feature/idea. My company heavily uses Duo for 
2FA and having support for it like we do with OpenVPN would allow us to 
move over to WireGuard easier. Duo uses a plugin to manage the 2FA 
workflow within OpenVPN. I am not sure if WireGuard could use something 
similar.

https://github.com/duosecurity/duo_openvpn/

Joe



--
Joe Doss
joe@solidadmin.com
