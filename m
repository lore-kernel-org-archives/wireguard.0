Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_40,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71380C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:36:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1420C6115B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1420C6115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iopositive.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cc46aef;
	Sat, 10 Apr 2021 14:27:36 +0000 (UTC)
Received: from smtpout1.mo528.mail-out.ovh.net
 (smtpout1.mo528.mail-out.ovh.net [46.105.34.251])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cc62db1b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Apr 2021 19:33:59 +0000 (UTC)
Received: from pro1.mail.ovh.net (unknown [10.109.156.27])
 by mo528.mail-out.ovh.net (Postfix) with ESMTPS id 6A2089D41542
 for <wireguard@lists.zx2c4.com>; Thu,  8 Apr 2021 21:33:59 +0200 (CEST)
Received: from DESKTOP7ERIPO5 (78.193.154.77) by DAG20EX2.emp.local
 (172.16.2.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.2106.2; Thu, 8 Apr 2021
 21:34:39 +0200
From: <f.diloo@iopositive.com>
To: <wireguard@lists.zx2c4.com>
Subject: Wireguard on Windows 10 Pro joined to a domain with limited rights
Date: Thu, 8 Apr 2021 21:33:53 +0200
Message-ID: <005e01d72cae$1f6cbab0$5e463010$@iopositive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcsrfcvkbX5xU50QFWs9XKZKtvfiA==
Content-Language: fr
X-Originating-IP: [78.193.154.77]
X-ClientProxiedBy: CAS7.emp.local (172.16.1.7) To DAG20EX2.emp.local
 (172.16.2.40)
X-Ovh-Tracer-Id: 6532189788805292879
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgudegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkfggtgfgofhtihesthejghdtvddtvdenucfhrhhomhepoehfrdguihhlohhosehiohhpohhsihhtihhvvgdrtghomheqnecuggftrfgrthhtvghrnhepheejuefhheejvdekffekieduffehueethfdvueetfeehiefgjeevkedvjeeuudeinecuffhomhgrihhnpehiohhpohhsihhtihhvvgdrtghomhenucfkpheptddrtddrtddrtddpjeekrdduleefrdduheegrdejjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehprhhouddrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehfrdguihhlohhosehiohhpohhsihhtihhvvgdrtghomhdprhgtphhtthhopeifihhrvghguhgrrhgusehlihhsthhsrdiigidvtgegrdgtohhm
X-Mailman-Approved-At: Sat, 10 Apr 2021 14:27:25 +0000
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

Hi team,

I'm using the version 0.3.9 and it's working fine for now except that I need
to put the end user (domain User)  inside the local admin group to make it
work .
Please note that with a PC not join to a domain , wireguard is running fine
with a local user wich is member of  "Network operator".
Does someone had any success running Wireguard in Corporate conditions
(Active Directory) with limited rights ?

Otherwise Wireguard is just great (simple & fast) , keep up the good work
guys.

Best regards

Fariaz Diloo
Founder | Solution Architect

Office:   + 33 9 72 56 37 71
Mobile:   + 33 6 21 18 44 00
IOPOSITIVE
5 AV DU GENERAL DE GAULLE 
94160 SAINT-MANDE
http://www.iopositive.com

IT & Cloud Services



