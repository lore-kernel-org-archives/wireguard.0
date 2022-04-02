Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF51C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Apr 2022 23:55:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 496702c8;
	Thu, 21 Apr 2022 23:48:52 +0000 (UTC)
Received: from resqmta-c1p-023465.sys.comcast.net
 (resqmta-c1p-023465.sys.comcast.net [2001:558:fd00:56::5])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 746a0d45
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Apr 2022 18:50:38 +0000 (UTC)
Received: from resomta-c1p-023278.sys.comcast.net ([96.102.18.240])
 by resqmta-c1p-023465.sys.comcast.net with ESMTP
 id ai2xnuhb0LLKyaipZnJta4; Sat, 02 Apr 2022 18:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
 s=20190202a; t=1648925437;
 bh=QrYQG3jR61XS6+8QyOcCgtewHVtv/NvUlID0XUwMQDk=;
 h=Received:Received:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Type;
 b=JM/9ZY0PGEx16bjXidWqD0pFRUJsDxlKOc0sbmOi0OMFRtrYu35oGZiVGO5jkbqcD
 e0jLA4LWpV/Z+eRW+Kxt1UR0LVJ2SJQW2DlLPADyz0hfbm9/AKN32oXnjRZ0//vOCb
 LELuR3v6clTle8LDQydNPVlj1aOYyI0dvJfCE3o04Rncsw2DM8g4Fsy6x74l0IlP3/
 0FISOy6yvnckJabwR7I53dkRd3JosK9ByGaee3eBHffmIW1G2WIUYflyL4D9ulmpG3
 /lfI9fWWzBmt2c/MTnYIDfIMg2nWiN2mL9VnN9pJfgTEV89fL6vd5JgD8Z1e4FLy59
 bSoZMx6ssrHBA==
Received: from Dad2 ([71.161.220.10])
 by resomta-c1p-023278.sys.comcast.net with ESMTPSA
 id aipRnyOfkskEkaipSnhQnp; Sat, 02 Apr 2022 18:50:35 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedvvddrudeikedgudefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucevohhmtggrshhtqdftvghsihdpqfgfvfdppffquffrtefokffrnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvfhgjufffkfggtgfgofhtsehtjehgtddvtddvnecuhfhrohhmpeeolhgvnhgrghhhrghnmhestghomhgtrghsthdrnhgvtheqnecuggftrfgrthhtvghrnhepieekieejtdeghfejtdevudekudeffedtieejleevgfekhfeuvdegjeehfeeigeelnecukfhppeejuddrudeiuddrvddvtddruddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghlohepffgrugdvpdhinhgvthepjedurdduiedurddvvddtrddutddpmhgrihhlfhhrohhmpehlvghnrghghhgrnhhmsegtohhmtggrshhtrdhnvghtpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfihirhgvghhurghrugeslhhishhtshdriiigvdgtgedrtghomh
X-Xfinity-VMeta: sc=0.00;st=legit
From: <lenaghanm@comcast.net>
To: <wireguard@lists.zx2c4.com>
References: 
In-Reply-To: 
Subject: Wireguard Windows Client questions
Date: Sat, 2 Apr 2022 14:50:29 -0400
Message-ID: <004a01d846c2$896fe0c0$9c4fa240$@comcast.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQC4vxNFHYpMIJzyNmOonMo2i40GLq8cBsgw
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:48:42 +0000
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


Good day, this is my first posting on this list. I have read many of the
past messages in the Archives but cannot find the answers I'm looking for
and hoped I could get help from this list.
I currently have a set up on multiple Windows PC's where the user needs to
access services on multiple remote systems. Depending on the service the
underlying network settings of the system may need to be changed and in some
cases require connecting to a VPN server. Currently there are 2 possible VPN
services (OpenVPN and SoftEtherVPN). I now need to add a 3rd option which is
Wireguard.

The interfaces to the VPN's are completely hidden from the users. They
simply double click on an icon for the service they want to connect to and
my code under the covers takes care of disconnecting any active sessions and
connecting to the new one. I have read the documentation on the
wireguard.exe options to see if I can develop a similar hidden mechanism to
connect and disconnect from a Wireguard peer and have the following
questions.

1. The documentation implies that if I executed the following command from a
command line "wireguard.exe" that it will start the Manager Service and show
the UI. It then states that calling wireguard.exe /installmanagerservice is
suitable for silent installation but what I find is that the Management GUI
is still activated and shown on the desktop. 
Is there anyway to start the service without the GUI window appearing? And
is there anyway to prevent the UI in the system tray from being installed?

2. If for any reason the Wireguard peer is not reachable then the Handshake
does not complete. When using the GUI the tunnel is shows Active but it is
the tunnelservice that is active not the connection. Is there a way to limit
the number of handshake retries before giving up on trying to connect?

3. From time to time the endpoint address of the peer system may have
changed (I do not use a dynamic DNS service) so when trying to connect I hit
the problem described in 2 above. I know what the new endpoint address is
and can set it dynamically using the wg set command and the connection is
then made. I would like to be able to programmatically save this change
without having to manually edit the client config files. I tried using wg
syncconf but get a permissions error because of the properties around the
dpapi config files.
Is there an alternative way to doing this short of deleting the existing
dpapi file and adding a new .conf file and have the manager service encrypt
it but that approach means I need to keep the private key in the clear
somewhere in order to create the new conf file.\

4. There are 2 option listed under wireguard command line options namely
/managerservice and /tunnelservice CONFIG_PATH - can someone tell me what
they are supposed to do every time I try running one of them I get an error
popup that says - The service process could not connect to the service
controller.wireguard

Thanks in advance for any guidance you can give me.

Regards
Mike


