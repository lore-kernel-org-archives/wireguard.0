Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bae86a75
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Aug 2018 20:01:04 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 4467f8f3
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Aug 2018 20:01:04 +0000 (UTC)
Date: Fri, 24 Aug 2018 15:11:44 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: Re: Wireguard not building on pre-rc1 4.19 kernels (Fedora)
Message-ID: <20180824201144.GA32165@wolff.to>
References: <20180820044022.GA11783@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20180820044022.GA11783@wolff.to>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Jason pushed a fix for this and now I am able to use vanilla WireGuard with 
4.19 kernels.
